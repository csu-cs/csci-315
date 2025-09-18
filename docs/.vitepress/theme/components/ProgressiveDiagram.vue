<script setup>
import { ref, onMounted, watch } from 'vue'

// Generate a unique prefix for each instance
const instanceId = Math.random().toString(36).slice(2, 9)

const props = defineProps({
  src: {
    type: String,
    required: true
  }
})

const step = ref(1)
const maxStep = ref(1)
const svgContainer = ref(null)

const next = () => {
  if (step.value < maxStep.value) step.value++
}
const prev = () => {
  if (step.value > 1) step.value--
}

// 🔧 Normalize src so it works with both `/public/...` and imported assets
const resolveSrc = () => {
  // Already looks like an absolute URL or public path → return directly
  if (
    props.src.startsWith('/') ||
    props.src.startsWith('http://') ||
    props.src.startsWith('https://')
  ) {
    return props.src
  }

  // Otherwise, treat as relative to this file (bundled asset)
  try {
    return new URL(props.src, import.meta.url).href
  } catch (err) {
    console.error('[ProgressiveDiagram] Failed to resolve src:', props.src, err)
    return props.src
  }
}

// 🔧 Parse step specs ("3", "2-4", "5-", "-6") to extract max step
function parseMaxFromSpec(spec) {
  spec = spec.trim()
  if (/^\d+$/.test(spec)) {
    return +spec
  } else if (/^\d+-\d+$/.test(spec)) {
    const [, end] = spec.split('-').map(Number)
    return end
  } else if (/^\d+-\s*$/.test(spec)) {
    const start = parseInt(spec, 10)
    return start
  } else if (/^-\d+$/.test(spec)) {
    return parseInt(spec.slice(1), 10)
  }
  return 1
}

// 🔧 Rewrites all IDs and references with a prefix
function uniquifySvgIds(svg, prefix) {
  // id="..." → id="prefix-..."
  svg = svg.replace(
    new RegExp(`id="(?!${prefix}-)([^"]+)"`, 'g'),
    (m, id) => `id="${prefix}-${id}"`
  )

  // url(#id) → url(#prefix-id)
  svg = svg.replace(
    new RegExp(`url\\(#(?!${prefix}-)([^)]+)\\)`, 'g'),
    (m, id) => `url(#${prefix}-${id})`
  )

  // href="#id" → href="#prefix-id"
  svg = svg.replace(
    new RegExp(`href="#(?!${prefix}-)([^"]+)"`, 'g'),
    (m, id) => `href="#${prefix}-${id}"`
  )

  // xlink:href="#id" → xlink:href="#prefix-id"
  svg = svg.replace(
    new RegExp(`xlink:href="#(?!${prefix}-)([^"]+)"`, 'g'),
    (m, id) => `xlink:href="#${prefix}-${id}"`
  )

  return svg
}


onMounted(async () => {
  const url = resolveSrc()
  const res = await fetch(url)
  if (!res.ok) {
    console.error(`[ProgressiveDiagram] Failed to load: ${url}`)
    return
  }

  var text = await res.text()

  // Prefix all defs IDs + references
  text = uniquifySvgIds(text, instanceId)

  // Inject SVG
  svgContainer.value.innerHTML = text

  // Determine max step across all data-step attributes
  const steps = svgContainer.value.querySelectorAll('[data-step]')
  let max = 1
  steps.forEach(el => {
    max = Math.max(max, parseMaxFromSpec(el.dataset.step))
  })
  maxStep.value = max

  updateVisibility()
})

const updateVisibility = () => {
  if (!svgContainer.value) return
  const groups = svgContainer.value.querySelectorAll('[data-step]')
  groups.forEach(el => {
    const spec = el.dataset.step.trim()
    let show = false
    if (/^\d+$/.test(spec)) {
      show = step.value === +spec
    } else if (/^\d+-\d+$/.test(spec)) {
      const [start, end] = spec.split('-').map(Number)
      show = step.value >= start && step.value <= end
    } else if (/^\d+-\s*$/.test(spec)) {
      const start = parseInt(spec, 10)
      show = step.value >= start
    } else if (/^-\d+$/.test(spec)) {
      const end = parseInt(spec.slice(1), 10)
      show = step.value <= end
    }
    el.style.display = show ? 'inline' : 'none'
  })
}

watch(step, updateVisibility)
</script>

<template>
  <div class="diagram">
    <div ref="svgContainer"></div>

    <div class="controls">
      <button @click="prev" :disabled="step === 1">◀</button>
      <span>{{ step }} / {{ maxStep }}</span>
      <button @click="next" :disabled="step === maxStep">▶</button>
    </div>

    <!-- Step indicator dots -->
    <div class="step-dots">
      <span
        v-for="n in maxStep"
        :key="n"
        class="dot"
        :class="{ active: step === n }"
        @click="step = n"
      ></span>
    </div>
  </div>
</template>

<style scoped>
.diagram {
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center; /* ensures everything, including SVG, centers */
}

/* Container around the SVG */
.diagram > div:first-child {
  display: flex;
  justify-content: center;
  margin: 0.5rem 0;
  width: 100%;
}

/* Make sure the actual <svg> scales responsively and is centered */
.diagram svg {
  display: block;
  margin: 0 auto;
  max-width: 100%;
  height: auto;
}

.controls {
  margin-top: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
}
button:disabled {
  opacity: 0.4;
  cursor: not-allowed;
}
.step-dots {
  margin-top: 0.5rem;
  display: flex;
  justify-content: center;
  gap: 0.5rem;
}
.dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: #ccc;
  cursor: pointer;
  transition: background 0.3s;
}
.dot.active {
  background: var(--vp-c-brand);
}
</style>

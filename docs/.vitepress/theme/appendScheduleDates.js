export function appendScheduleDates(startMonday) {
    const monday = new Date(startMonday);
    monday.setHours(0, 0, 0, 0);

    const table = document.getElementById("schedule-table");
    if (!table) return;

    for (const row of table.tBodies[0].rows) {
        const cell = row.cells[0];
        const match = /^(\d+)([AB])$/i.exec(cell.textContent.trim());

        if (match) {
            const weekNum = parseInt(match[1], 10);
            const dayLetter = match[2].toUpperCase();
            const dayOffset = (dayLetter === "A" ? 1 : 3) + (weekNum - 1) * 7;

            const newDate = new Date(monday);
            newDate.setDate(monday.getDate() + dayOffset);

            const formatted = `${newDate.getMonth() + 1}/${newDate.getDate()}`;
            cell.textContent = `${cell.textContent} (${formatted})`;
        }
        else
        {
            const match = /^(\d+)$/i.exec(cell.textContent.trim());
            if (match) {
                const weekNum = parseInt(match[1], 10);
                const dayOffset = (weekNum - 1) * 7;

                const newMonday = new Date(monday);
                newMonday.setDate(monday.getDate() + dayOffset);

                const newFriday = new Date(monday);
                newFriday.setDate(monday.getDate() + dayOffset + 4);

                const formatted = `${newMonday.getMonth() + 1}/${newMonday.getDate()} – ${newFriday.getMonth() + 1}/${newFriday.getDate()}`;
                cell.textContent = `${cell.textContent} (${formatted})`;
            }
        }
    }
}

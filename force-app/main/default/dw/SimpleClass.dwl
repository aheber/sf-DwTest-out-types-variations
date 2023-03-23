%dw 2.4
input payload application/json
output application/apex
---
payload map {} as Object { class: "OutShape" }

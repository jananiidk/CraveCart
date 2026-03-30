// LOAD MENU FROM DATABASE
async function loadMenu() {
  try {
    const res = await fetch("http://localhost:3000/menu");
    const data = await res.json();

    const container = document.getElementById("menu");

    container.innerHTML = "";

    data.forEach(item => {
      const div = document.createElement("div");
      div.className = "card";

      div.innerHTML = `
        <h3>${item.item_name}</h3>
        <p>₹${item.Price}</p>
        <button onclick="orderItem('${item.item_name}', ${item.Price})">
          Order
        </button>
      `;

      container.appendChild(div);
    });

  } catch (err) {
    console.log(err);
  }
}

// PLACE ORDER
async function orderItem(name, price) {
  await fetch("http://localhost:3000/order", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      item_name: name,
      price: price
    })
  });

  alert("Order placed!");
}

// LOAD ON START
window.onload = loadMenu;
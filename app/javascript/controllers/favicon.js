const linkForFavicon = document.querySelector(
  `head > link[rel='icon']`
);

function faviconTemplate(string, icon) {
  return `
    <svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22>
      <text y=%22.9em%22 font-size=%2290%22>
        ${icon}
      </text>
    </svg>
  `.trim();
}

const buttons = document.querySelectorAll(`.favicon-grid > button`);
buttons.forEach(button => {
  button.addEventListener("click", () => {
    newFavicon = faviconTemplate`${button.innerText}`;
    console.log(newFavicon);
    linkForFavicon.setAttribute(`href`, `data:image/svg+xml,${newFavicon}`);
  });
});

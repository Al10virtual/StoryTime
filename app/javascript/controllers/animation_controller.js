import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {

    //Get context and screen size;
    var ctx = cnv.getContext("2d");
    var W = window.innerWidth;
    var H = window.innerHeight;

    //Set Canvas;
    cnv.width = W;
    cnv.height = H;

    //Glow effect;
    ctx.shadowBlur = 10;
    ctx.shadowColor = "white";

    function animate() {
      //Random position and size of stars;
      let x = W * Math.random();
      let y = H * Math.random();
      let r = 2.5 * Math.random();

      //Draw the stars;
      ctx.beginPath();
      ctx.fillStyle = "white";
      ctx.arc(x, y, r, 0, Math.PI * 2);
      ctx.fill();

      //Using setTimeout instead of window.requestAnimationFrame for slower speed... window.requestAnimationFrame is approximately equal to setTimeout(func, 17);
      setTimeout(animate, 500);
    }
    animate();
  }
}

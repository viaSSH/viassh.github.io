---
layout: splash2

permalink: /dev/garage
title: "3D Tree Dev"
excerpt: "developing"
classes: wide
hidden: true
author_profile: false

---

<div id="my-3d-canvas">

</div>


<style>
   body { margin: 0; }
   canvas { width: 60%; height: 60% }
   #gui {
     position: absolute;
     top: 124px;
     right: 50px 
  }
</style>

<script type="text/javascript">
var renderer = new THREE.WebGLRenderer( { antialias: true, alpha: true} );
renderer.setSize( window.innerWidth, window.innerHeight );
renderer.setPixelRatio( window.devicePixelRatio );
renderer.setSize( window.innerWidth, window.innerHeight );
renderer.gammaInput = true;
renderer.gammaOutput = true;
renderer.shadowMap.enabled = true;

// document.body.appendChild( renderer.domElement );
document.getElementById("my-3d-canvas").appendChild( renderer.domElement );




var scene = new THREE.Scene();

var camera = new THREE.PerspectiveCamera( 45, window.innerWidth / window.innerHeight, 1, 500 );

var controls = new THREE.OrbitControls( camera );
var gui;

camera.position.set( 0, 50, 50 );
controls.update();
camera.lookAt( 0, 0, 0 );

// var camera = new THREE.OrthographicCamera( window.innerWidth / - 2, window.innerWidth / 2, window.innerHeight / 2, window.innerHeight / - 2, 1, 1000 );
// scene.add( camera );


scene.background = new THREE.Color( 0xcce0ff );
scene.fog = new THREE.Fog( 0xcce0ff, 500, 10000 );

var loader = new THREE.TextureLoader();
// ground
var groundTexture = loader.load( 'three.js-master/examples/textures/terrain/grasslight-big.jpg' );
groundTexture.wrapS = groundTexture.wrapT = THREE.RepeatWrapping;
groundTexture.repeat.set( 25, 25 );
groundTexture.anisotropy = 16;
var groundMaterial = new THREE.MeshLambertMaterial( { map: groundTexture } );
var mesh = new THREE.Mesh( new THREE.PlaneBufferGeometry( 20000, 20000 ), groundMaterial );
mesh.position.y = -250;
mesh.rotation.x = - Math.PI / 2;
mesh.receiveShadow = true;
// scene.add( mesh );


//add bg
// Load the background texture
// var texture = THREE.TextureLoader( 'https://images.pexels.com/photos/956981/milky-way-starry-sky-night-sky-star-956981.jpeg?auto=compress&cs=tinysrgb&h=350' );
// var backgroundMesh = new THREE.Mesh(
//     new THREE.PlaneGeometry(2, 2, 0),
//     new THREE.MeshBasicMaterial({
//         map: texture
//     }));
//
// backgroundMesh .material.depthTest = false;
// backgroundMesh .material.depthWrite = false;
//
// // Create your background scene
// var backgroundScene = new THREE.Scene();
// var backgroundCamera = new THREE.Camera();
// backgroundScene .add(backgroundCamera );
// backgroundScene .add(backgroundMesh );
// var texture = new THREE.TextureLoader().load( 'https://images.pexels.com/photos/956981/milky-way-starry-sky-night-sky-star-956981.jpeg?auto=compress&cs=tinysrgb&h=350' );
//
// // immediately use the texture for material creation
// var material = new THREE.MeshBasicMaterial( { map: texture } );



//create a blue LineBasicMaterial

var material = new THREE.LineBasicMaterial( { color: 0x0000ff, linewidth: 13 } );
var geometry;// = new THREE.Geometry();

var i;
var line;
var d2r = Math.PI / 180.0;

function componentToHex(c) {
    var hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(r, g, b) {
    return "0x" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

function drawLine(x1,y1,z1, x2,y2,z2, depth){
  const points = [];
  // points.push( new THREE.Vector3( - 10, 0, 0 ) );
  points.push(new THREE.Vector3( x1, z1, y1) );
  points.push(new THREE.Vector3( x2, z2, y2) );
  const geometry = new THREE.BufferGeometry().setFromPoints( points );

  // geometry = new THREE.Geometry();
  // geometry.vertices.push(new THREE.Vector3( x1, z1, y1) );
  // geometry.vertices.push(new THREE.Vector3( x2, z2, y2) );
  var r = parseInt((157 / API.depth) * depth);
  var g = 91;
  var b = 0;
  // rgbToHex(r, g, b);
  var test = 0x7f3f00;

  var material = new THREE.LineBasicMaterial( { color: parseInt(rgbToHex(r, g, b)), linewidth: 10} );
  // var material = new THREE.LineBasicMaterial( { color: 0x7f3f00, linewidth: 10} );
  // var material = new THREE.LineBasicMaterial( { color: test, linewidth: 10} );

  line = new THREE.Line( geometry, material );
  scene.add( line );
}



function drawTree(x, y, z, angle1, angle2, depth){
  if(depth !== 0){

    var weight = 2;

    var xx = x + (Math.sin(angle1*d2r) * depth * weight);
    var yy = y + (Math.sin(angle2*d2r) * depth * weight);
    var zz = z + (Math.cos(angle1*d2r) * Math.cos(angle2*d2r) * depth * weight);

    drawLine(x,y,z, xx, yy, zz, depth);

    var i;
    var diff_angle = 360 / API.branch;

    var c_angle1, c_angle2;

    for(i=0 ; i<API.branch ; i++){
        c_angle1 = Math.cos(diff_angle*i*d2r) * API.diff;
        c_angle2 = Math.sin(diff_angle*i*d2r) * API.diff;
        drawTree(xx, yy, zz, angle1+c_angle1, angle2+c_angle2,  depth-1);
    }


  }

}
var options = {

  start: function() {
    drawTree(API.x, API.y, 0, API.angle1, API.angle2, API.depth);
    // console.log(API.angle1, API.angle2, API.depth, API.branch);
    renderer.render( scene, camera );
  },

  clear: function(){
    while(scene.children.length > 0){
      scene.remove(scene.children[0]);
    }
    scene.add( helper );
  }
};

var API = {
  branch: 3,
  depth: 3,
  diff: 30,
  angle1: 0,
  angle2: 0,
  x: 0,
  y: 0

};

var depth = 3;


var outer_angle = 0;
// drawTree(0, 0, 0, 0, 0, depth);

var helper = new THREE.GridHelper( 1000, 100 );
            helper.position.y = 0;
            helper.material.opacity = 0.25;
            helper.material.transparent = true;
            scene.add( helper );

// renderer.render( backgroundScene , backgroundCamera );


renderer.render( scene, camera );
animate();
initGui();

function animate() {

   requestAnimationFrame( animate );

   // required if controls.enableDamping or controls.autoRotate are set to true
   controls.update();

   renderer.render( scene, camera );

}
function updateUvTransform() {
  console.log("change");

        // drawTree(0, 0, 0, API.angle1, API.angle2, API.depth);
        console.log(API.angle1, API.angle2, API.depth, API.branch);
            renderer.render( scene, camera );
}
// function restart(){
//   console.log("okkkk");
// }

function initGui() {
            gui = new dat.GUI();
            gui.add( API, 'depth', 1, 8, 1 ).name( 'depth' ).onChange( updateUvTransform );
        gui.add( API, 'branch', 2, 6, 1 ).name( 'branch' ).onChange( updateUvTransform );
        gui.add( API, 'diff', 10, 90, 10 ).name( 'diff' ).onChange( updateUvTransform );
        gui.add( API, 'angle1', 0, 90, 10 ).name( 'angle1' ).onChange( updateUvTransform );
        gui.add( API, 'angle2', 0, 90, 10 ).name( 'angle2' ).onChange( updateUvTransform );
        gui.add( API, 'x', -200, 200, 10 ).name( 'x' ).onChange( updateUvTransform );
        gui.add( API, 'y', -200, 200, 10 ).name( 'y' ).onChange( updateUvTransform );
        gui.add(options, 'start');
        gui.add(options, 'clear');
         }

</script>

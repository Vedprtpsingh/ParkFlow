document.addEventListener("DOMContentLoaded", () => {
    const scenes = document.querySelectorAll(".scene");
    let currentScene = 0;

    function showScene(index) {
        scenes.forEach((scene, i) => {
            scene.classList.toggle("active", i === index);
        });
    }

    function animateScene1() {
        // Radar scan and blinking slot already animated by CSS
        // Highlight slot1 as selected
        const slot1 = document.getElementById("slot1");
        slot1.classList.add("available");
    }

    function animateScene2() {
        const car = document.getElementById("car");
        let pos = 0;
        const roadWidth = 540; // road width minus car width
        const interval = setInterval(() => {
            if (pos >= roadWidth) {
                clearInterval(interval);
                nextScene();
            } else {
                pos += 5;
                car.style.left = pos + "px";
            }
        }, 50);
    }

    function animateScene3() {
        const message = document.getElementById("detection-message");
        const barrier = document.getElementById("barrier-open");
        const car = document.getElementById("car-enter");

        message.style.opacity = "1";

        setTimeout(() => {
            barrier.classList.add("open");
            // Move car forward
            let pos = 0;
            const interval = setInterval(() => {
                if (pos >= 200) {
                    clearInterval(interval);
                    barrier.classList.remove("open");
                    nextScene();
                } else {
                    pos += 5;
                    car.style.left = pos + "px";
                }
            }, 50);
        }, 2000);
    }

    function animateScene4() {
        const car = document.getElementById("car-park");
        const slotB = document.getElementById("slotB");
        let pos = 20;
        const targetPos = 260; // approximate position of slotB
        const interval = setInterval(() => {
            if (pos >= targetPos) {
                clearInterval(interval);
                slotB.classList.remove("available");
                slotB.classList.add("occupied");
                nextScene();
            } else {
                pos += 5;
                car.style.left = pos + "px";
            }
        }, 50);
    }

    function animateScene5() {
        // Backend icons pulse by CSS animation
        setTimeout(() => {
            nextScene();
        }, 4000);
    }

    function animateScene6() {
        // End message shown, no animation needed
    }

    function nextScene() {
        currentScene++;
        if (currentScene < scenes.length) {
            showScene(currentScene);
            runAnimationForScene(currentScene);
        }
    }

    function runAnimationForScene(index) {
        switch (index) {
            case 0:
                animateScene1();
                setTimeout(nextScene, 4000);
                break;
            case 1:
                animateScene2();
                break;
            case 2:
                animateScene3();
                break;
            case 3:
                animateScene4();
                break;
            case 4:
                animateScene5();
                break;
            case 5:
                animateScene6();
                break;
        }
    }

    // Start animation
    showScene(0);
    runAnimationForScene(0);
});

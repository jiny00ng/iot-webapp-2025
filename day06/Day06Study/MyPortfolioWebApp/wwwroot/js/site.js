// Please see documentation at https://learn.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
/**
* Template Name: Kelly
* Template URL: https://bootstrapmade.com/kelly-free-bootstrap-cv-resume-html-template/
* Updated: Aug 07 2024 with Bootstrap v5.3.3
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/

(function () {
    "use strict";

    function toggleScrolled() {
        const selectBody = document.querySelector("body");
        const selectHeader = document.querySelector("#header");
        if (
            !selectHeader.classList.contains("scroll-up-sticky") &&
            !selectHeader.classList.contains("sticky-top") &&
            !selectHeader.classList.contains("fixed-top")
        )
            return;
        window.scrollY > 100
            ? selectBody.classList.add("scrolled")
            : selectBody.classList.remove("scrolled");
    }

    document.addEventListener("scroll", toggleScrolled);
    window.addEventListener("load", toggleScrolled);

    const mobileNavToggleBtn = document.querySelector(".mobile-nav-toggle");

    function mobileNavToggle() {
        document.querySelector("body").classList.toggle("mobile-nav-active");
        mobileNavToggleBtn.classList.toggle("bi-list");
        mobileNavToggleBtn.classList.toggle("bi-x");
    }

    mobileNavToggleBtn.addEventListener("click", mobileNavToggle);

    document.querySelectorAll("#navmenu a").forEach((navmenu) => {
        navmenu.addEventListener("click", () => {
            if (document.querySelector(".mobile-nav-active")) {
                mobileNavToggle();
            }
        });
    });

    document.querySelectorAll(".navmenu .toggle-dropdown").forEach((navmenu) => {
        navmenu.addEventListener("click", function (e) {
            e.preventDefault();
            this.parentNode.classList.toggle("active");
            this.parentNode.nextElementSibling.classList.toggle("dropdown-active");
            e.stopImmediatePropagation();
        });
    });

    const preloader = document.querySelector("#preloader");
    if (preloader) {
        window.addEventListener("load", () => {
            preloader.remove();
        });
    }

    let scrollTop = document.querySelector(".scroll-top");

    function toggleScrollTop() {
        if (scrollTop) {
            window.scrollY > 100
                ? scrollTop.classList.add("active")
                : scrollTop.classList.remove("active");
        }
    }

    scrollTop.addEventListener("click", (e) => {
        e.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: "smooth",
        });
    });

    window.addEventListener("load", toggleScrollTop);
    document.addEventListener("scroll", toggleScrollTop);

    function aosInit() {
        AOS.init({
            duration: 600,
            easing: "ease-in-out",
            once: true,
            mirror: false,
        });
    }
    window.addEventListener("load", aosInit);

    let skillsAnimation = document.querySelectorAll(".skills-animation");
    skillsAnimation.forEach((item) => {
        new Waypoint({
            element: item,
            offset: "80%",
            handler: function () {
                let progress = item.querySelectorAll(".progress .progress-bar");
                progress.forEach((el) => {
                    el.style.width = el.getAttribute("aria-valuenow") + "%";
                });
            },
        });
    });

    new PureCounter();

    function initSwiper() {
        document.querySelectorAll(".init-swiper").forEach(function (swiperElement) {
            let config = JSON.parse(
                swiperElement.querySelector(".swiper-config").innerHTML.trim()
            );

            if (swiperElement.classList.contains("swiper-tab")) {
                initSwiperWithCustomPagination(swiperElement, config);
            } else {
                new Swiper(swiperElement, config);
            }
        });
    }

    window.addEventListener("load", initSwiper);

    const glightbox = GLightbox({
        selector: ".glightbox",
    });

    document.querySelectorAll(".isotope-layout").forEach(function (isotopeItem) {
        let layout = isotopeItem.getAttribute("data-layout") ?? "masonry";
        let filter = isotopeItem.getAttribute("data-default-filter") ?? "*";
        let sort = isotopeItem.getAttribute("data-sort") ?? "original-order";

        let initIsotope;
        imagesLoaded(isotopeItem.querySelector(".isotope-container"), function () {
            initIsotope = new Isotope(isotopeItem.querySelector(".isotope-container"), {
                itemSelector: ".isotope-item",
                layoutMode: layout,
                filter: filter,
                sortBy: sort,
            });
        });

        isotopeItem.querySelectorAll(".isotope-filters li").forEach(function (filters) {
            filters.addEventListener(
                "click",
                function () {
                    isotopeItem
                        .querySelector(".isotope-filters .filter-active")
                        .classList.remove("filter-active");
                    this.classList.add("filter-active");
                    initIsotope.arrange({
                        filter: this.getAttribute("data-filter"),
                    });
                    if (typeof aosInit === "function") {
                        aosInit();
                    }
                },
                false
            );
        });
    });
})();

@media screen and(max - width: 768px) {
    [data - aos - delay] {
        transition - delay: 0!important;
    }
}

.page - title {
    color: var(--default -color);
    background - color: var(--background - color);
    padding: 25px 0;
    position: relative;
    border - bottom: 1px solid rgba(0, 0, 0, 0.1);
}

.page - title h1 {
    font - size: 24px;
    font - weight: 400;
}

.page - title.breadcrumbs ol {
    display: flex;
    flex - wrap: wrap;
    list - style: none;
    padding: 0;
    margin: 0;
    font - size: 14px;
    font - weight: 400;
}

.page - title.breadcrumbs ol li + li {
    padding - left: 10px;
}

.page - title.breadcrumbs ol li + li::before {
    content: "/";
    display: inline - block;
    padding - right: 10px;
    color: rgba(0, 0, 0, 0.4);
}

section,
.section {
    color: var(--default -color);
    background - color: var(--background - color);
    padding: 60px 0;
    scroll - margin - top: 100px;
    overflow: clip;
}

@media(max - width: 1199px) {
    section,
  .section {
        scroll - margin - top: 66px;
    }
}

.section - title {
    text - align: center;
    padding - bottom: 60px;
    position: relative;
}

.section - title h2 {
    font - size: 32px;
    font - weight: 700;
    margin - bottom: 20px;
    padding - bottom: 20px;
    position: relative;
}

.section - title h2::after {
    content: "";
    position: absolute;
    display: block;
    width: 50px;
    height: 3px;
    background: var(--accent - color);
    left: 0;
    right: 0;
    bottom: 0;
    margin: auto;
}

.section - title p {
    margin - bottom: 0;
}

.hero {
    width: 100 %;
    min - height: calc(100vh - 82px);
    position: relative;
    padding: 80px 0;
    display: flex;
    align - items: center;
    justify - content: center;
}

@media(max - width: 1200px) {
  .hero {
        min - height: calc(100vh - 68px);
    }
}

.hero img {
    position: absolute;
    inset: 0;
    display: block;
    width: 100 %;
    height: 100 %;
    object - fit: cover;
    z - index: 1;
}

.hero.container {
    position: relative;
    z - index: 3;
}

.hero h2 {
    margin: 0;
    font - size: 48px;
    font - weight: 700;
}

.hero p {
    margin: 10px 0 0 0;
    font - size: 24px;
    color: var(--heading - color);
}

.hero.btn - get - started {
    color: var(--contrast - color);
    background: var(--accent - color);
    font - family: var(--heading - font);
    text - transform: uppercase;
    font - weight: 600;
    font - size: 12px;
    letter - spacing: 1px;
    display: inline - block;
    padding: 12px 40px;
    border - radius: 50px;
    transition: 0.5s;
    margin - top: 30px;
}

.hero.btn - get - started:hover {
    background: rgba(0, 123, 255, 0.9); /* fallback for color-mix */
}

@media(max - width: 768px) {
  .hero h2 {
        font - size: 32px;
    }

  .hero p {
        font - size: 18px;
    }
}

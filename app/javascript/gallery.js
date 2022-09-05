import lightbox from 'lightbox2'

document.addEventListener('turbo:load', () => {
    lightbox.init()

    lightbox.option({
        'resizeDuration': 100,
        'wrapAround': true,
        'fadeDuration': 100,
        'imageFadeDuration': 100,
        'fitImagesInViewport': true
    })
})

window.addEventListener("popstate", function (event) {
    location.reload(true);
})

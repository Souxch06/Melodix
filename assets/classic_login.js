(function hideAlternativeLoginMethods() {
    const passwordlessLabel = /^(?:log|sign)\s+in\s+without\s+(?:a\s+)?password$|^(?:se\s+connecter|connexion)\s+sans\s+(?:mot\s+de\s+)?passe$/i;
    const passwordlessTestId = /(?:passwordless|magic[-_ ]?link|one[-_ ]?time[-_ ]?passcode)/i;

    function hidePasswordlessOptions() {
        document.querySelectorAll('a, button, [role="link"], [role="button"]').forEach((element) => {
            const label = (element.innerText || element.textContent || element.getAttribute('aria-label') || '')
                .replace(/\s+/g, ' ')
                .trim();
            const testId = element.getAttribute('data-testid') || '';

            if (passwordlessLabel.test(label) || passwordlessTestId.test(testId)) {
                element.style.setProperty('display', 'none', 'important');
                element.setAttribute('aria-hidden', 'true');
                element.setAttribute('tabindex', '-1');
            }
        });
    }

    hidePasswordlessOptions();

    if (typeof MutationObserver !== 'undefined' && document.documentElement) {
        const observer = new MutationObserver(hidePasswordlessOptions);
        observer.observe(document.documentElement, {
            childList: true,
            subtree: true,
            characterData: true
        });
        window.addEventListener('pagehide', () => observer.disconnect(), { once: true });
    }
})();

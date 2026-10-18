(() => {
  const ids = [
    '#global-nav-bar',
    '#Desktop_LeftSidebar_Id',
    '#main-view',
    '#sf-mobile-nav',
    '#sf-mobile-navigation'
  ];

  const presence = {};
  ids.forEach((selector) => {
    presence[selector] = document.querySelector(selector) !== null;
  });

  const body = document.body;
  const sidebar = document.querySelector('#Desktop_LeftSidebar_Id');
  const v20Dock = document.querySelector('#sf-mobile-navigation');
  const currentDock = document.querySelector('#sf-mobile-nav');

  const result = {
    host: window.location.hostname,
    userAgent: navigator.userAgent,
    width: {
      innerWidth: window.innerWidth,
      screenWidth: window.screen ? window.screen.width : null,
      visualViewportWidth: window.visualViewport
        ? window.visualViewport.width
        : null
    },
    selectors: presence,
    guiMode: window.SF_CONFIG ? window.SF_CONFIG.guiMode : null,
    dockLeftSidebar: window.SF_CONFIG
      ? window.SF_CONFIG.dockLeftSidebar
      : null,
    bodyClasses: body ? body.className : null,
    drawer: {
      expanded: typeof window.__sfLibraryExpanded === 'boolean'
        ? window.__sfLibraryExpanded
        : null,
      libraryOpenClass: body
        ? body.classList.contains('sf-library-open')
        : null,
      guestClass: body ? body.classList.contains('sf-guest') : null,
      expandedClass: body ? body.classList.contains('sf-expanded') : null
    },
    dockDisplay: {
      sfMobileNav: currentDock
        ? window.getComputedStyle(currentDock).display
        : null,
      sfMobileNavigation: v20Dock
        ? window.getComputedStyle(v20Dock).display
        : null
    },
    sidebarDisplay: sidebar
      ? window.getComputedStyle(sidebar).display
      : null
  };

  console.log('[Melodix DOM diagnostic]', JSON.stringify(result, null, 2));
  return result;
})()

(function (root, factory) {
    const runtime = factory();
    if (typeof module === 'object' && module.exports) module.exports = runtime;
    if (root) root.MelodixRuntime = runtime;
})(typeof window !== 'undefined' ? window : null, function () {
    'use strict';

    const AUTH_STATE = Object.freeze({
        UNKNOWN: 'unknown',
        SIGNED_OUT: 'signed-out',
        SIGNED_IN: 'signed-in'
    });

    // A public landing page or a login CTA is evidence that sign-in is needed,
    // never evidence that the account is authenticated. A positive UI signal
    // requires both an account/profile control and the actual player controls.
    function classifyAuthSignals(signals) {
        const state = signals || {};
        if (state.accountsPage || state.loginRoute || state.loginAction) {
            return AUTH_STATE.SIGNED_OUT;
        }
        if (state.profileControl && state.playerControls) {
            return AUTH_STATE.SIGNED_IN;
        }
        return AUTH_STATE.UNKNOWN;
    }

    // An unknown rendered state must remain visible as an uncertainty, even if
    // the last confirmed state was signed-out before the user tried logging in.
    function shouldShowUnconfirmedNotice(state) {
        return state === AUTH_STATE.UNKNOWN;
    }

    // Unknown observations are deliberately not promoted to signed-in/out. They
    // may occur while Spotify re-renders its page; callers can show a warning
    // without repeatedly notifying native code or guessing at session validity.
    function createAuthStateMachine(onTransition) {
        let observed = AUTH_STATE.UNKNOWN;
        let confirmed = AUTH_STATE.UNKNOWN;
        const notify = typeof onTransition === 'function' ? onTransition : function () {};

        return {
            observe(signals) {
                observed = classifyAuthSignals(signals);
                if (observed !== AUTH_STATE.UNKNOWN && observed !== confirmed) {
                    confirmed = observed;
                    notify(confirmed);
                }
                return observed;
            },
            getState() {
                return observed;
            },
            getConfirmedState() {
                return confirmed;
            }
        };
    }

    // The phone library drawer starts closed independently of Spotify's current
    // DOM width/classes, which change between page versions and during hydration.
    function createDrawerState(initiallyOpen) {
        let open = initiallyOpen === true;
        return {
            isOpen() {
                return open;
            },
            setOpen(value) {
                open = value === true;
                return open;
            },
            toggle() {
                open = !open;
                return open;
            }
        };
    }

    return Object.freeze({
        AUTH_STATE,
        classifyAuthSignals,
        shouldShowUnconfirmedNotice,
        createAuthStateMachine,
        createDrawerState
    });
});

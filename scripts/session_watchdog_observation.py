"""Strict UI observation for the session/content watchdog interaction.

Called only by the emulator acceptance script. The injected clock/sampler make
unit tests deterministic; production uses actual uiautomator snapshots and time.
No session, cookie, navigation or app state is synthesized by this helper.
"""
import time
from launcher_surface import demo_visible, login_surface


def observe_watchdog(sample, mode, duration, clock=time.monotonic, sleep=time.sleep):
    """Require a continuously present expected surface and no CONTENT STUCK.

    Sampling is bounded and monotonic. A failure raises before acceptance and is
    later recorded with the real failure screenshot by the caller.
    """
    if mode not in ('demo', 'after-exit') or duration < 0:
        raise ValueError('invalid watchdog observation')
    deadline = clock() + duration
    while True:
        items = sample()
        texts = [value for n in items for value in (n.get('text', ''), n.get('content-desc', '')) if value]
        if any('CONTENT STUCK' in value for value in texts):
            raise RuntimeError('watchdog diagnostic covered the observed surface')
        if mode == 'demo':
            if 'MODE DÉMO · HORS LIGNE' not in texts:
                raise RuntimeError('demo surface disappeared during watchdog observation')
        else:
            if demo_visible(items):
                raise RuntimeError('demo still visible after exit')
            def has_id(name):
                return any(n.get('resource-id', '').endswith(':id/' + name) for n in items)
            session = has_id('sessionTitle') or login_surface(items) is not None
            settings = has_id('nativeSettingsButton')
            if not session and not settings:
                raise RuntimeError('real session or settings disappeared after demo exit')
            if session and 'Essayer le mode démo' not in texts:
                raise RuntimeError('session demo entry disappeared after demo exit')
        remaining = deadline - clock()
        if remaining <= 0:
            return
        sleep(min(2.0, remaining))

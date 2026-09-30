import * as React from 'react';
import { render, fireEvent, RenderResult } from '@testing-library/react-native';
import { BottomTabBar } from '../BottomTabBar';
import { styles } from '../styles';
import { translations } from '@data';
import { Pages } from '@config';

// La barre lit l'inset gestuelle (marge basse safe-area) — valeur factice de test.
jest.mock('react-native-safe-area-context', () => ({
  useSafeAreaInsets: () => ({ top: 24, bottom: 34, left: 0, right: 0 }),
}));

type RouteInput = { key: string; name: string };

const makeProps = (
  routes: RouteInput[] = [
    { key: 'home-1', name: Pages.HOME },
    { key: 'search-2', name: Pages.SEARCH },
    { key: 'library-3', name: Pages.LIBRARY },
  ],
  activeIndex = 0
) => {
  const state = { routes, index: activeIndex, key: 'tab', routeNames: routes.map((r) => r.name), history: [], type: 'tab', stale: false } as const;
  const descriptors = Object.fromEntries(
    routes.map((route) => [
      route.key,
      {
        options: { tabBarAccessibilityLabel: route.name },
        render: () => null,
        navigation: {},
        route,
      },
    ])
  );
  const emit = jest.fn(() => ({ defaultPrevented: false }));
  const navigate = jest.fn();
  const navigation = { emit, navigate };
  return { state, descriptors, navigation, emit, navigate };
};

describe('BottomTabBar', () => {
  let container: RenderResult;

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('renders one tab per route with its label', () => {
    const props = makeProps();
    container = render(
      <BottomTabBar
        state={props.state as never}
        descriptors={props.descriptors as never}
        navigation={props.navigation as never}
        insets={{ top: 0, bottom: 0, left: 0, right: 0 } as never}
      />
    );

    expect(container.getByText(translations.router[Pages.HOME])).toBeTruthy();
    expect(container.getByText(translations.router[Pages.SEARCH])).toBeTruthy();
    expect(container.getByText(translations.router[Pages.LIBRARY])).toBeTruthy();
  });

  it('navigates to an inactive tab on press', () => {
    const props = makeProps(undefined, 0);
    container = render(
      <BottomTabBar
        state={props.state as never}
        descriptors={props.descriptors as never}
        navigation={props.navigation as never}
        insets={{ top: 0, bottom: 0, left: 0, right: 0 } as never}
      />
    );

    fireEvent.press(container.getByText(translations.router[Pages.SEARCH]));
    expect(props.navigate).toHaveBeenCalledWith(Pages.SEARCH);
  });

  it('does not navigate when pressing the active tab', () => {
    const props = makeProps(undefined, 0);
    container = render(
      <BottomTabBar
        state={props.state as never}
        descriptors={props.descriptors as never}
        navigation={props.navigation as never}
        insets={{ top: 0, bottom: 0, left: 0, right: 0 } as never}
      />
    );

    fireEvent.press(container.getByText(translations.router[Pages.HOME]));
    expect(props.navigate).not.toHaveBeenCalled();
  });

  it('5C.1 — container EN FLUX (jamais absolu) : cohabite avec le MiniPlayer dans le slot tabBar', () => {
    // Régression 5C.1 : en position absolute, la barre ne comptait plus dans
    // la mesure du slot tabBar personnalisé (MiniPlayer + barre) et se
    // superposait au MiniPlayer. Le flux garde l'empilement attendu.
    expect(styles.container).not.toMatchObject({ position: 'absolute' });
    expect(styles.container).toMatchObject({
      height: expect.any(Number),
      flexDirection: 'row',
      overflow: 'hidden',
    });
  });

  it('respects a prevented default tab press', () => {
    const props = makeProps(undefined, 0);
    props.emit.mockReturnValueOnce({ defaultPrevented: true });
    container = render(
      <BottomTabBar
        state={props.state as never}
        descriptors={props.descriptors as never}
        navigation={props.navigation as never}
        insets={{ top: 0, bottom: 0, left: 0, right: 0 } as never}
      />
    );

    fireEvent.press(container.getByText(translations.router[Pages.LIBRARY]));
    expect(props.navigate).not.toHaveBeenCalled();
  });
});

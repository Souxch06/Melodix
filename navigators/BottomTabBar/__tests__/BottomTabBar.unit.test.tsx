import * as React from 'react';
import { render, fireEvent, RenderResult } from '@testing-library/react-native';
import { BottomTabBar } from '../BottomTabBar';
import { translations } from '@data';
import { Pages } from '@config';

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

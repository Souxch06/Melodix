import * as React from 'react';
import { render, RenderResult } from '@testing-library/react-native';
import { Info, InfoPropsType } from '../Info';

describe('Info', () => {
  let container: RenderResult;
  const defaultProps: InfoPropsType = {
    infoTexts: ['12 août 2022', '28 titres • 1h 36min'],
  };

  beforeEach(() => {
    container = render(<Info {...defaultProps} />);
  });

  afterEach(() => {
    jest.clearAllMocks();
  });

  it('renders every info text', () => {
    defaultProps.infoTexts.forEach((text) => {
      expect(container.getByText(text)).toBeTruthy();
    });
  });

  it('renders nothing crashing with an empty list', () => {
    const { queryAllByText } = render(<Info infoTexts={[]} />);
    expect(queryAllByText(/.+/)).toHaveLength(0);
  });
});

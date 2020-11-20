import { findNodeHandle, UIManager } from 'react-native';
import { COMPONENT_NAME } from 'src/helper';

const callNativeMethod = (
  instance: any,
  methodName: string,
  ...args: any[]
) => {
  UIManager.dispatchViewManagerCommand(
    findNodeHandle(instance),
    // @ts-ignore
    UIManager[COMPONENT_NAME].Commands[methodName],
    args
  );
};

export default callNativeMethod;

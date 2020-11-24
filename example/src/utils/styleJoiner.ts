import { StyleSheet } from 'react-native';

const styleJoiner = (...args: any[]) => StyleSheet.flatten(args);

export default styleJoiner;

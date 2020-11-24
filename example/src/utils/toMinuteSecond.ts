const addZero = (number: number): string | number =>
  number < 10 ? `0${number}` : number;

const toMinuteSecond = (time: number): string => {
  const hour = Math.floor(time / 1000 / 60 / 60);
  const minute = Math.floor((time / 1000 / 60 / 60 - hour) * 60);
  const second = Math.floor(
    ((time / 1000 / 60 / 60 - hour) * 60 - minute) * 60
  );

  return `${addZero(minute)}:${addZero(second)}`;
};

export default toMinuteSecond;

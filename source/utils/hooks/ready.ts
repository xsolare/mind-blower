/* eslint-disable no-console */
export const readyCallback = () => {
  console.log(' ');
  console.log('\x1B[36m%s\x1B[0m', '🚀 Server started');
  console.log('\x1B[36m%s\x1B[0m', 'NODE:', process.env.npm_config_user_agent);
  console.log(' ');
};

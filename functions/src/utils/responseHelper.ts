export const apiResponse = (
  success: boolean,
  data: any = null,
  message = '',
  other: any = null
) => ({
  success,
  data,
  message,
  other,
});

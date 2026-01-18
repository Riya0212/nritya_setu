"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.apiResponse = void 0;
const apiResponse = (success, data = null, message = '', other = null) => ({
    success,
    data,
    message,
    other,
});
exports.apiResponse = apiResponse;

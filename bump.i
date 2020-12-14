# 1 "bump.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "bump.c"


const unsigned int bump_sampleRate = 11025;
const unsigned int bump_length = 2360;

const signed char bump_data[] = {
0, 0, -1, 0, 0, -1, 0, -1, -1, 0, -1, 0, -1, -1, -1, -1, -1, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0,
-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, -1, 0, 0, -1, 0, -1, -1, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1,
0, -1, 0, -1, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0,
-1, 0, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0,
-1, -1, 0, -1, 1, -3, 3, -8, 79, 127, 109, 114, 105, 106, 99, 98, 94, 92, 89, 86,
83, 80, 79, 75, 74, 71, 69, 67, 64, 63, 60, 60, 55, 58, 48, 62, -14, -81, -62, -69,
-62, -64, -59, -59, -56, -55, -53, -51, -50, -48, -47, -45, -44, -43, -41, -40, -38, -39, -35, -37,
-32, -37, -27, -42, 17, 99, 83, 87, 80, 80, 76, 74, 72, 70, 68, 65, 64, 61, 60, 58,
56, 54, 52, 51, 48, 49, 45, 47, 41, 45, 36, 48, 6, -88, -78, -79, -75, -73, -71, -69,
-67, -64, -63, -60, -59, -56, -56, -53, -52, -50, -49, -47, -46, -44, -44, -41, -42, -38, -40, -34,
-39, -29, -44, 25, 98, 79, 86, 77, 79, 73, 73, 69, 68, 66, 63, 62, 59, 59, 55, 55,
51, 52, 48, 49, 45, 46, 42, 44, 40, 41, 37, 38, 36, 34, 34, -64, -93, -79, -84, -75,
-78, -71, -73, -67, -68, -64, -64, -60, -60, -57, -56, -54, -52, -51, -48, -48, -45, -46, -42, -44,
-39, -42, -35, -41, -31, -43, -7, 89, 83, 82, 80, 76, 75, 71, 71, 66, 67, 62, 63, 58,
59, 55, 55, 52, 52, 49, 49, 46, 45, 43, 42, 41, 39, 40, 35, 39, 30, 44, -34, -98,
-79, -86, -77, -79, -73, -73, -69, -68, -66, -64, -62, -59, -59, -55, -56, -52, -52, -48, -50, -45,
-47, -42, -44, -40, -42, -37, -39, -35, -37, -30, 70, 91, 79, 83, 75, 77, 71, 72, 67, 68,
63, 63, 59, 59, 56, 55, 53, 51, 50, 48, 47, 44, 45, 41, 43, 38, 41, 34, 40, 29,
43, -2, -93, -83, -84, -79, -78, -75, -73, -71, -68, -67, -64, -63, -60, -59, -57, -55, -53, -52,
-50, -48, -47, -45, -45, -43, -42, -40, -39, -38, -37, -36, -33, -36, -29, -39, 49, 99, 80, 87,
77, 81, 73, 75, 70, 70, 66, 65, 62, 61, 59, 57, 55, 53, 52, 49, 49, 46, 47, 43,
44, 40, 42, 37, 40, 35, 38, 32, 36, 29, 36, 13, -87, -89, -85, -84, -79, -79, -74, -75,
-70, -70, -65, -66, -62, -62, -58, -58, -54, -55, -51, -51, -48, -48, -46, -45, -43, -42, -41, -39,
-39, -36, -38, -32, -37, -27, -42, 30, 100, 81, 87, 78, 80, 75, 75, 71, 70, 67, 65, 63,
61, 59, 57, 56, 53, 53, 49, 50, 46, 47, 43, 44, 40, 42, 38, 39, 35, 37, 33, 35,
31, 33, 26, -75, -94, -83, -86, -79, -81, -74, -76, -70, -71, -66, -66, -62, -62, -58, -58, -55,
-55, -52, -51, -49, -48, -47, -44, -44, -41, -42, -38, -40, -35, -39, -32, -38, -27, -42, 11, 97,
83, 86, 80, 80, 76, 74, 72, 69, 68, 65, 64, 61, 60, 57, 56, 54, 52, 51, 49, 47,
46, 45, 43, 42, 41, 39, 38, 36, 36, 34, 35, 31, 33, 28, 33, 23, 38, -25, -103, -85,
-91, -83, -84, -79, -78, -75, -73, -71, -68, -67, -63, -63, -59, -59, -56, -56, -52, -53, -49, -49,
-46, -46, -44, -43, -41, -40, -39, -37, -37, -35, -36, -32, -35, -29, -34, -24, -39, 22, 102, 85,
89, 82, 82, 78, 77, 74, 71, 70, 67, 66, 62, 62, 58, 58, 55, 55, 51, 52, 48, 48,
45, 45, 43, 42, 40, 39, 38, 36, 36, 34, 35, 31, 34, 27, 33, 23, 38, -20, -102, -86,
-90, -83, -83, -79, -78, -75, -72, -71, -68, -67, -63, -63, -59, -59, -56, -56, -52, -53, -49, -49,
-46, -46, -44, -43, -41, -40, -39, -37, -38, -35, -36, -32, -35, -29, -34, -24, -39, 17, 101, 85,
89, 83, 82, 79, 76, 74, 71, 70, 67, 66, 62, 62, 58, 59, 55, 55, 51, 52, 48, 48,
45, 45, 43, 42, 41, 39, 39, 36, 37, 33, 35, 30, 34, 27, 34, 23, 38, -16, -101, -87,
-90, -84, -83, -80, -78, -75, -73, -71, -68, -67, -64, -63, -60, -59, -56, -55, -53, -52, -50, -49,
-47, -46, -44, -43, -42, -40, -39, -38, -37, -36, -34, -34, -32, -32, -29, -31, -27, -30, -24, -30,
-20, -35, 19, 104, 89, 93, 86, 86, 82, 80, 77, 75, 73, 70, 68, 65, 64, 61, 60, 58,
57, 54, 53, 51, 50, 48, 46, 45, 44, 42, 41, 40, 38, 37, 36, 35, 34, 32, 33, 30,
31, 27, 30, 24, 30, 20, 35, -19, -104, -89, -93, -86, -86, -82, -80, -78, -75, -73, -70, -69,
-66, -65, -62, -61, -58, -57, -55, -53, -52, -50, -49, -47, -46, -44, -43, -41, -40, -39, -38, -37,
-35, -35, -33, -33, -30, -32, -28, -31, -25, -31, -20, -36, 19, 104, 88, 92, 85, 85, 81, 79,
77, 74, 72, 69, 68, 65, 64, 61, 60, 57, 56, 54, 53, 51, 49, 48, 46, 45, 43, 42,
41, 39, 38, 37, 36, 34, 34, 32, 32, 30, 31, 27, 30, 24, 30, 20, 34, -20, -105, -89,
-93, -86, -86, -82, -80, -77, -75, -73, -70, -69, -66, -65, -62, -61, -58, -57, -54, -54, -51, -51,
-48, -48, -45, -45, -42, -43, -39, -40, -37, -38, -34, -36, -32, -34, -29, -34, -19, 84, 91, 85,
85, 80, 80, 75, 75, 70, 70, 66, 66, 62, 62, 58, 58, 55, 55, 51, 51, 48, 48, 45,
45, 42, 42, 40, 40, 38, 37, 35, 34, 34, 32, 32, 29, 32, 25, 35, -55, -102, -84, -91,
-81, -84, -77, -78, -73, -73, -69, -69, -65, -64, -61, -60, -58, -56, -54, -53, -51, -49, -48, -46,
-45, -43, -43, -40, -41, -38, -39, -35, -37, -32, -36, -29, -35, -24, -39, 16, 101, 85, 89, 82,
82, 78, 77, 73, 71, 69, 67, 65, 63, 61, 59, 58, 55, 54, 51, 51, 48, 48, 45, 45,
42, 43, 39, 40, 37, 38, 34, 36, 32, 34, 29, 32, 27, 32, 16, -86, -93, -87, -87, -82,
-82, -77, -77, -72, -72, -68, -68, -64, -64, -60, -60, -56, -56, -53, -53, -50, -50, -47, -47, -44,
-44, -41, -41, -39, -38, -37, -36, -35, -33, -34, -30, -33, -26, -36, 55, 101, 83, 89, 80, 83,
76, 77, 71, 72, 67, 67, 63, 63, 60, 59, 56, 55, 53, 52, 50, 48, 47, 45, 44, 42,
42, 39, 39, 37, 37, 34, 36, 31, 34, 28, 34, 23, 38, -18, -102, -86, -90, -83, -83, -79,
-78, -74, -73, -70, -68, -66, -64, -62, -60, -59, -56, -55, -52, -52, -49, -49, -46, -46, -43, -44,
-40, -41, -38, -39, -35, -37, -33, -35, -30, -33, -28, -33, -16, 86, 92, 86, 86, 81, 81, 76,
76, 71, 71, 67, 67, 63, 63, 59, 59, 55, 55, 52, 52, 49, 49, 46, 46, 43, 43, 40,
40, 38, 37, 36, 35, 34, 32, 32, 29, 32, 25, 35, -57, -101, -84, -90, -81, -84, -77, -78,
-72, -73, -68, -68, -64, -64, -61, -60, -57, -56, -54, -53, -51, -49, -48, -46, -45, -43, -43, -40,
-40, -38, -38, -35, -37, -32, -35, -29, -35, -24, -39, 18, 101, 84, 89, 82, 82, 78, 76, 74,
71, 70, 67, 66, 62, 62, 58, 58, 54, 55, 51, 52, 48, 49, 45, 46, 42, 43, 39, 40,
37, 37, 36, 34, 35, 30, 37, -57, -97, -81, -87, -78, -80, -74, -75, -70, -70, -67, -65, -63,
-61, -59, -57, -56, -53, -53, -50, -49, -47, -46, -45, -43, -43, -40, -41, -37, -39, -33, -39, -28,
-43, 11, 97, 82, 85, 79, 79, 75, 73, 71, 68, 67, 64, 63, 60, 59, 57, 56, 53, 52,
50, 48, 47, 45, 45, 42, 42, 39, 40, 36, 38, 34, 36, 32, 34, 25, -76, -93, -82, -85,
-78, -80, -74, -74, -70, -70, -66, -65, -62, -61, -59, -57, -55, -53, -52, -50, -49, -47, -46, -44,
-43, -42, -40, -40, -37, -38, -34, -38, -28, -43, 34, 99, 80, 86, 78, 79, 74, 74, 70, 69,
66, 64, 62, 60, 59, 56, 55, 53, 52, 50, 48, 47, 45, 44, 42, 42, 39, 40, 36, 38,
33, 37, 29, 39, 9, -89, -88, -84, -83, -79, -78, -74, -74, -69, -69, -65, -65, -61, -61, -58,
-57, -55, -53, -52, -50, -49, -46, -46, -43, -44, -41, -41, -38, -38, -37, -35, -36, -31, -38, 55,
97, 79, 86, 77, 79, 73, 74, 69, 69, 65, 64, 62, 60, 58, 56, 55, 52, 51, 49, 48,
46, 45, 44, 42, 42, 39, 40, 36, 38, 32, 38, 27, 42, -11, -97, -83, -86, -81, -80, -77,
-74, -72, -69, -68, -65, -64, -61, -60, -58, -57, -54, -53, -51, -49, -49, -46, -46, -43, -44, -40,
-41, -37, -39, -35, -37, -33, -35, -27, 74, 92, 81, 84, 77, 79, 73, 73, 69, 69, 65, 64,
61, 60, 58, 56, 54, 52, 51, 49, 48, 46, 45, 43, 42, 41, 39, 39, 36, 37, 33, 37,
27, 42, -34, -100, -81, -87, -79, -80, -75, -75, -71, -70, -67, -65, -64, -61, -60, -57, -56, -54,
-53, -51, -49, -48, -46, -45, -43, -43, -40, -41, -37, -39, -34, -38, -30, -39, -11, 88, 87, 83,
82, 78, 77, 73, 73, 68, 68, 64, 64, 60, 60, 57, 56, 54, 52, 51, 49, 48, 45, 45,
42, 43, 40, 40, 37, 37, 36, 34, 35, 30, 37, -55, -98, -80, -87, -78, -80, -74, -75, -70,
-70, -67, -65, -63, -61, -60, -57, -56, -53, -53, -50, -50, -47, -47, -44, -43, -42, -40, -41, -35,
-45, 43, 94, 75, 82, 73, 76, 70, 70, 66, 65, 63, 61, 59, 57, 56, 53, 53, 49, 49,
46, 46, 44, 43, 42, 40, 40, 36, 39, 31, 43, -38, -97, -78, -85, -76, -78, -72, -73, -68,
-68, -65, -63, -61, -59, -58, -56, -54, -52, -51, -49, -48, -46, -45, -43, -43, -40, -40, -38, -38,
-36, -35, -34, -33, -32, -31, -30, -29, -28, -27, -27, -26, -25, -24, -24, -23, -22, -21, -21, -20,
-20, -19, -18, -18, -17, -17, -16, -16, -15, -15, -14, -14, -14, -13, -13, -12, -12, -12, -11, -11,
-11, -10, -10, -10, -9, -9, -9, -9, -8, -8, -8, -8, -7, -7, -7, -7, -7, -6, -6, -6,
-6, -6, -6, -5, -5, -5, -5, -5, -5, -5, -4, -4, -4, -4, -4, -4, -4, -4, -4, -3,
-3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -2, -2, -2, -2, -2, -2, -2,
-2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, 0, -1, 0, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1,
-1, -1, 0, -1, 0, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 0,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
-1, -1, -1, -1, -1, -1, -1, -1, 0, -1, -1, -1, 0, -1, 0, -1, -1, -1, -1, 0,
-1, -1, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0,
0, -1, -1, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1, 0, 0, -1, 0, -1, 0, -1,
-1, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, };
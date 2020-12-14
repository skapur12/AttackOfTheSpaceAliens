
//{{BLOCK(layerOne)

//======================================================================
//
//	layerOne, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 318 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 10176 + 4096 = 14784
//
//	Time-stamp: 2020-11-23, 19:37:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LAYERONE_H
#define GRIT_LAYERONE_H

#define layerOneTilesLen 10176
extern const unsigned short layerOneTiles[5088];

#define layerOneMapLen 4096
extern const unsigned short layerOneMap[2048];

#define layerOnePalLen 512
extern const unsigned short layerOnePal[256];

#endif // GRIT_LAYERONE_H

//}}BLOCK(layerOne)

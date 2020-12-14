
//{{BLOCK(layerTwo)

//======================================================================
//
//	layerTwo, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 217 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 6944 + 2048 = 9504
//
//	Time-stamp: 2020-11-28, 11:48:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LAYERTWO_H
#define GRIT_LAYERTWO_H

#define layerTwoTilesLen 6944
extern const unsigned short layerTwoTiles[3472];

#define layerTwoMapLen 2048
extern const unsigned short layerTwoMap[1024];

#define layerTwoPalLen 512
extern const unsigned short layerTwoPal[256];

#endif // GRIT_LAYERTWO_H

//}}BLOCK(layerTwo)

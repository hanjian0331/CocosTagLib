//
//  main.m
//  macDemo
//
//  Created by seemelk on 16/6/7.
//  Copyright © 2016年 seemeHJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CocosTagLib/tag_c.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int seconds;
        int minutes;
        TagLib_File *file = taglib_file_new("/Users/seemelk/Desktop/07.我亲爱的偏执狂.flac");
        TagLib_Tag *tag;
        const TagLib_AudioProperties *properties;
        if(file == NULL)
            return 0;
        
        tag = taglib_file_tag(file);
        properties = taglib_file_audioproperties(file);
        
        if(tag != NULL) {
            printf("-- TAG --\n");
            printf("title   - \"%s\"\n", taglib_tag_title(tag));
            printf("artist  - \"%s\"\n", taglib_tag_artist(tag));
            printf("album   - \"%s\"\n", taglib_tag_album(tag));
            printf("year    - \"%i\"\n", taglib_tag_year(tag));
            printf("comment - \"%s\"\n", taglib_tag_comment(tag));
            printf("track   - \"%i\"\n", taglib_tag_track(tag));
            printf("genre   - \"%s\"\n", taglib_tag_genre(tag));
        }
        
        if(properties != NULL) {
            seconds = taglib_audioproperties_length(properties) % 60;
            minutes = (taglib_audioproperties_length(properties) - seconds) / 60;
            
            printf("-- AUDIO --\n");
            printf("bitrate     - %i\n", taglib_audioproperties_bitrate(properties));
            printf("sample rate - %i\n", taglib_audioproperties_samplerate(properties));
            printf("channels    - %i\n", taglib_audioproperties_channels(properties));
            printf("length      - %i:%02i\n", minutes, seconds);
        }
        
        taglib_tag_free_strings();
        taglib_file_free(file);
    }
    return 0;
}

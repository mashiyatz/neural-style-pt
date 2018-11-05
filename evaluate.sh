#!/bin/bash

python linear-color-transfer.py --target_image styles/style.jpg --source_image input/content.png --output_image output/style_colored.png

python lum-transfer.py --content_image input/content.png --style_image output/style_colored.png --cp_mode lum --output_style_image output/style_lum.png --output_content_image output/content_lum.png --org_content input/content.png

python neural_style.py -style_image output/style_lum.png -content_image output/content_lum.png -image_size 500 -num_iterations 10 -output_img output/out.png -save_iter 0 

python lum-transfer.py --output_lum2 output/out.png --cp_mode lum2 --output_image output/out_combined.png --org_content input/content.png

python linear-color-transfer.py --target_image output/out_combined.png --source_image input/content.png --output_image share/out_combined_color.png


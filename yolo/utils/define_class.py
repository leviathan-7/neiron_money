from os import walk
import tqdm


CLASS_NUM = 2
PATH_TO_DIR = 'C:/Users/nikit/Downloads/credit_card.v1-v1.yolov8/test/labels'

filenames = next(walk(PATH_TO_DIR), (None, None, []))[2]
for filename in tqdm.tqdm(filenames):
    with open(PATH_TO_DIR + '/' + filename, 'r') as file:
        old_lines = file.readlines()

    new_lines = []
    for line in old_lines:
        right_part = ' '.join(line.split(' ')[1:])
        new_lines.append(str(CLASS_NUM) + ' ' + right_part)

    with open(PATH_TO_DIR + '/' + filename, 'w') as file:
        file.writelines(new_lines)

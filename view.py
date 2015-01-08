import sys
import argparse
import pygame

pygame.init() 

def get_parameters():
	parser = argparse.ArgumentParser(description='Draws a DLA simulation log with a special format')
	parser.add_argument('log', help='log file')
	return parser.parse_args()

def formatPos(pos):
	return tuple(map(int,pos.split(',')))

def color(value):
	color = ''
	if value == 5:
		color = (0, 255, 0)
	elif value == 7:
		color = (0, 0, 0)
	elif value == 0:
		color = (0, 0, 0)
	else:
		color = (255, 0, 0)
	return color

stateChanges = []
# create the screen
window = pygame.display.set_mode((100, 100)) 

for line in open(get_parameters().log,'r'):
	splitLine = line.split()
	stateChanges.append({'time': splitLine[0], 'pos': formatPos(splitLine[1]), 'value': float(splitLine[2])})
print len(stateChanges)
lastTime = ''
for stateChange in stateChanges:
	#draw a line - see http://www.pygame.org/docs/ref/draw.html for more
	x = stateChange['pos'][0] * 2
	y = stateChange['pos'][1] * 2
	pygame.draw.rect(window, color(stateChange['value']), pygame.Rect(x, y, 2, 2))
	if lastTime != stateChange['time']:
		lastTime = stateChange['time']
		pygame.display.flip() 
		#pygame.time.wait(33)
		pygame.time.wait(1)
pygame.display.flip()
# #draw it to the screen
pygame.image.save(window,'pepe.bmp')

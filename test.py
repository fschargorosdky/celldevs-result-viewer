import sys
#import and init pygame
import pygame
pygame.init() 

stateChanges = []
for line in f:
	splitLine = line.split()
	stateChanges.append({'time': splitLine[0], 'value': splitLine[1], 'pos': splitLine[2]})

#create the screen
window = pygame.display.set_mode((640, 480)) 

#draw a line - see http://www.pygame.org/docs/ref/draw.html for more 
pygame.draw.line(window, (255, 255, 255), (0, 0), (30, 50))

#draw it to the screen
pygame.display.flip() 

pygame.image.save(window,'pepe.bmp')

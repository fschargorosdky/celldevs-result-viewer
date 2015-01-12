[top]
components : simpledla

[simpledla]
type : cell
width : 50
height : 50
delay : transport
defaultDelayTime  : 100
border : wrapped 
neighbors : 									simpledla(-3,0)
neighbors : 						simpledla(-2,-1) 	simpledla(-2,0) 	simpledla(-2,1)
neighbors : 		 	simpledla(-1,-2) simpledla(-1,-1) 	simpledla(-1,0) 	simpledla(-1,1) 	simpledla(-1,2)
neighbors : simpledla(0,-3)	simpledla(0,-2)	simpledla(0,-1)	simpledla(0,0)	simpledla(0,1)	simpledla(0,2)	simpledla(0,3) 
neighbors : 			simpledla(1,-2) 	simpledla(1,-1) 	simpledla(1,0) 	simpledla(1,1) 	simpledla(1,2) 
neighbors : 						simpledla(2,-1) 	simpledla(2,0) 	simpledla(2,1)  
neighbors :		 								simpledla(3,0)
initialvalue : 0
initialrowvalue : 24     00000000000000000000000010000000000000000000000000
localtransition : simpledla-rule
zone : upperBorder { (0,0)..(0,49) }
zone : lowerBorder { (49,0)..(49,49) }
zone : leftBorder { (1,0)..(48,0) }
zone : rightBorder { (1,49)..(48,49) }

[simpledla-rule]
% the particle becomes fixed if an adjacent cell contains fixed particle
rule : 5 100 { (0,0) > 0 and (0,0) < 5 and
	((-1, 0) = 5 or (0, -1) = 5 or (0, 1) = 5 or (1, 0) = 5 ) 
	%and	(cellpos(0) > 1 and cellpos(0) < 48 and cellpos(1) > 1 and cellpos(1) < 48)
}  
%Si la particula esta en el borde y se puede pegar desaparece

% if the cell is empty and there is a mobile particle moving in
rule : {round(uniform(0.5,4.5))} 100 { (0,0) = 0 and (
	((0,-1)=2	and (-1, -1)!=5	and (1,-1)	!=5	and (0,-2)	!=5 )	or
 	((-1,0)=3	and (-1,-1)	!=5	and (-2,0)	!=5	and (-1,1)	!=5 )	or
	((0,1)=4	and (1,1)	!=5	and (0,2)	!=5	and (1,1)	!=5 )	or
	((1,0)=1	and (1,1)	!=5	and (2,0)	!=5	and (1,-1)	!=5 ) 
	)}
% if no mobile particles around, empty cell remains empty
rule : 0 100 {(0,0)=0 and t}
% %%%%%%%%
% for the cell containning the mobile particles
% %%%%%%%%
% direction = 1 (up)
% stay and change direction when nowhere to move
rule : {round(uniform(0.5,4.5))} 100 { (0,0)=1 and (-1,0)!=0 }
rule : {round(uniform(0.5,4.5))} 100 { (0,0)=1 and (-1,0)=0 and (
	((-2,0)	=3	and	(-2,-1)	!=5	and	(-3,0) 	!=5 and (-2,1)	!=5 ) or
	((-1,-1)=2	and	(-1,-2)	!=5 and	(-2,-1)	!=5 and (0,-1)	!=5 ) or
	((-1,1)	=4	and	(-2,1)	!=5	and	(-1,2) 	!=5 and (0,1)	!=5 )
	)}
% move otherwise
rule : 0 100 {(0,0)=1 and (-1,0)=0 and t}
% direction = 2 (right)
% stay and change direction when nowhere to move
rule : {round(uniform(0.5,4.5))} 100 { (0,0)=2 and (0,1)!=0 }
rule : {round(uniform(0.5,4.5))} 100 { (0,0)=2 and (0,1)=0 and (
	((0,2)=4	and (-1,2) !=5	and (0,3) !=5	and (1,2)	!=5	) or
	((-1,1)=3	and (-1,0) !=5	and (-2,1)!=5	and (-1,2)	!=5 ) 
	)}
% move otherwise
rule : 0 100 {(0,0)=2 and (0,1)=0 and t}
% direction = 3 (down)
% stay and change direction when nowhere to move
rule : {round(uniform(0.5,4.5))} 100 { (0,0)=3 and (1,0)!=0 }
rule : {round(uniform(0.5,4.5))} 100 { (0,0)=3 and (1,0)=0 and
	((1,1)=4 and (0,1) !=5 and (1,2) !=5 and (2,1) !=5 ) 
	}				
% move otherwise
rule : 0 100 { (0,0)=3 and (1,0)=0 and t}
% direction = 4 (left)
% stay and change direction when nowhere to move
rule : {round(uniform(0.5,4.5))} 100 { (0,0)=4 and (0,-1)!=0 }
% move otherwise
rule : 0 100 { (0,0)=4 and (0,-1)=0 and t}
% fixed particles remains to be fixed
rule : 5 100 { (0,0) = 5 }
% any others
rule : { (0, 0) } 100 { t}

[upperBorder]
rule : 0 100 {statecount(5) > 0} %If there are fixed particles around stop generation of new particles
rule : 3 100 {round(uniform(0,100)) = 1}
rule : 7 100 {(0,0) = 0}
rule : 0 100 {t}

[lowerBorder]
rule : 0 100 {statecount(5) > 0} %If there are fixed particles around stop generation of new particles
rule : 1 100 {round(uniform(0,100)) = 1}
rule : 7 100 {(0,0) = 0}
rule : 0 100 {t}

[leftBorder]
rule : 0 100 {statecount(5) > 0} %If there are fixed particles around stop generation of new particles
rule : 2 100 {round(uniform(0,100)) = 1}
rule : 7 100 {(0,0) = 0}
rule : 0 100 {t}

[rightBorder]
rule : 0 100 {statecount(5) > 0} %If there are fixed particles around stop generation of new particles
rule : 4 100 {round(uniform(0,100)) = 1}
rule : 7 100 {(0,0) = 0}
rule : 0 100 {t}


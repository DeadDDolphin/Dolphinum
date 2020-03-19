max(X,Y,X):-X>Y,!.
max(_,Y,Y).
max3(X,Y,U,Z):-max(Y,U,K),max(X,K,Z).

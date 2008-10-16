Feature: Map
	In order to have a spatial representation of things
	I want to have a map class which does this

	Scenario: Size test
		Given a map of size 10,5
		Then the x-size should be 5
		And the y-size should be 10

	Scenario: Correct initialization
		Given a map of size 3,3
		Then all tiles should be nil
		
	Scenario: Edge detection
	  Given a map of size 3,3
	  Then accessing the tile at -1,-1 should raise exception
	  And accessing the tile at 1,1 should not raise exception
	  And accessing the tile at 3,3 should raise exception
	  
	Scenario: Reading a tile
	  Given a map of size 3,3
	  And the tile at 1,1 contains A
	  Then the tile at 1,1 should contain A

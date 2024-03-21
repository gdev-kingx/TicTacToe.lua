--Start a new Game
function new()
    a = {" ", " ", " "}
    b = {" ", " ", " "}
    c = {" ", " ", " "}
    player = 1
    print("New Game started")
end

--Print board to screen
function board()
	print("\n")
	print("     A   B   C ")
	print("\n")
	print(" 1   "..a[1].." | "..b[1].." | "..c[1].." ")
	print("    ------------")
	print(" 2   "..a[2].." | "..b[2].." | "..c[2].." ")
	print("    ------------")
	print(" 3   "..a[3].." | "..b[3].." | "..c[3].." ")
	print("\n")
end

--Check to see if there is a winner
function win(id)
    if isblank(a) and isblank(b) and isblank(c) then return false end

    if linecheck(a[1], b[1], c[1]) and a[1] ~= " " then
        print("Player #"..id.." has won!!");
		return true
    elseif linecheck(a[2],b[2],c[2]) and a[2] ~= " "then
		print("Player #"..id.." has won!!");
		return true
	elseif linecheck(a[3],b[3],c[3]) and a[3] ~= " " then
		print("Player #"..id.." has won!!");
		return true
	elseif linecheck(a[1],a[2],a[3]) and a[1] ~= " "then
		print("Player #"..id.." has won!!");
		return true
	elseif linecheck(b[1],b[2],b[3]) and b[1] ~= " " then
		print("Player #"..id.." has won!!");
		return true
	elseif linecheck(c[1],c[2],c[3]) and c[1] ~= " " then
		print("Player #"..id.." has won!!");
		return true
	elseif linecheck(a[1],b[2],c[3]) and a[1] ~= " " then
		print("Player #"..id.." has won!!");
		return true
	elseif linecheck(c[1],b[2],a[3]) and c[1] ~= " " then
		print("Player #"..id.." has won!!");
		return true
	elseif fullboard() then
		print("No player has won. Please try again");
		return true
	else
		return false
    end
end

--Ensure that the columns are blank
function isblank(col)
    local count = 0
    for _,v in pairs(col) do
        if v == " " then 
            count = count + 1
        end
    end
    if count == 3 then return true end
    return false
end

--Check to see if there is no decisive winner
function fullboard()
    local count = 0
    for i = 1,3 do
        if (a[i] ~= " ") and (b[i] ~= " ") and (c[i] ~= " ") then
			count = count + 1
		end
    end
    if count == 3 then return true end
	return false
end

--Check to determine if the player has 3 in a row
function linecheck(i, j, k)
    return (i == j) and (j == k) and (i == k)
end

--Place a particular players marker in a cell
function boardplacement(cell)
    local pm = string.lower(cell)
    local mark

    if player == 1 then
        mark = "X"
    else
        mark = "O"
    end

    if pm == "a1" and a[1] == " " then
		a[1] = mark
		return true
	elseif pm == "a2" and a[2] == " " then
		a[2] = mark
		return true
	elseif pm == "a3" and a[3] == " " then
		a[3] = mark
		return true
	elseif pm == "b1" and b[1] == " " then
		b[1] = mark
		return true
	elseif pm == "b2" and b[2] == " " then
		b[2] = mark
		return true
	elseif pm == "b3" and b[3] == " " then
		b[3] = mark
		return true
	elseif pm == "c1" and c[1] == " " then
		c[1] = mark
		return true
	elseif pm == "c2" and c[2] == " " then
		c[2] = mark
		return true
	elseif pm == "c3" and c[3] == " " then
		c[3] = mark
		return true
	else
		print("Unknown cell or Cell is already occupied")
		return false
	end
end

--Move player pointer to the next player
function nextPlayer()
    if player == 1 then
        player = 2
    else
        player = 1
    end
end

--Start Game function
function start(cmd)
    if cmd == "n" then
        new()
        local currentPlayer
        repeat
            currentPlayer = player
            io.write("Player #"..currentPlayer..", enter cell number:")
            io.flush()
            if boardplacement(io.read()) then
                nextPlayer()
            end
            board()
        until (win(currentPlayer) == true)
    else
        print("Unknown command")
    end
end

--Infinite loop to start program. 'q' to break the loop and quit
while true do
    io.write("Press 'n' to start a new game and 'q' to quit: ")
    io.flush()
    local answer = io.read()
    if answer == "q" then
        break
    else
        start(answer)
    end
end

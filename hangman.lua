local words = {'banana', 'keyboard', 'orange', 'apple', 'mouse', 'airpods'}
local word = words[math.random(1, #words)]
local temp = {}

print("WELCOME TO THE HANGMAN GAME")
print("HINT: the word have "..#word.." letter\n")

for i=1, #word do
    local letter = word:sub(i, i)
    temp[letter] = "-"
end

function Attempt(word_, array, letter)
    if string.find(word_, letter) then
        print("GG, you found the letter "..letter.." !")
        if array[letter] == 1 then
            print("You already found this letter !")
            return true
        end
        array[letter] = 1
        return true
    else
        return false
    end
end

function Check(word_, array)
    local check = 0
    for i=1, #word_ do
        local letter = word_:sub(i, i)
        local index = array[letter]
        if index == "-" then
            check = check + 1
        end
    end
    if check == 0 then
        print("GG, you found the word "..word_)
        return true
    end
end

function Get(word_, array)
    local temp_word = ""
    for i=1, #word_ do
        local letter = word_:sub(i, i)
        local index = array[letter]
        if index == "-" then
            temp_word = temp_word.."-"
        elseif index == 1 then
            temp_word = temp_word..letter
        end
    end
    return temp_word
end

function IsInteger(entry)
    return tonumber(entry) and true or false
end

function CheckEntry(entry)
    local isint = IsInteger(entry)

    if string.len(entry) > 1 and isint then
        print("You must enter only one letter !")
    elseif isint then
        print("You can't enter a number only letters are accepted !")
    else
        return true
    end
end

while true do
    ::userEntry::
    print("Enter a letter:")
    local user = io.read("l")
    if not CheckEntry(user) then
        goto userEntry
    end

    if Attempt(word, temp, user) then
        print(Get(word, temp).."\n")
        if Check(word, temp) then
            break
        end
    else
        print("\nTry again !")
    end
end

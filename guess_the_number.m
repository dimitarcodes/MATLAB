Pickme = round(10 + 10*rand(1)); % old picker changed to number between 10 and 20
Picker = round(100*rand(1));    % randomly pick number between 0 and 100
NrGuesses = 0;                  % initialize guess counter
Guessedcorrectly = 0;           % initialize correct guess boolean
nrplayers = 5;                  % initialize number of players
while (Guessedcorrectly == 0 && NrGuesses <10)  % repeat until either a correct guess or number of rounds == 10
    guesses = zeros(nrplayers); % initialize guess array
    % acquire every player's guess
    for i = 1:nrplayers
        guesses(i) = input(['Player ',int2str(i),' take your guess: ']);
    end
    % identify correct guesses
    correct = find(guesses == Picker);
    % if nobody guessed correctly
    if isempty(correct)
        % increment the round number
        NrGuesses = NrGuesses +1;
        % if 10 rounds are reached terminate game
        if NrGuesses == 10
            disp('GAME OVER, everybody guessed wrong 10 times!');
        else % else announce everyone's failure
            disp([int2str(NrGuesses), ' times everybody guessed Wrong']);
        end
    else
        % if somebody guessed correctly, terminate game
        Guessedcorrectly = 1;
        % announce winners
        for i = 1:length(correct)
            disp(['Player ', int2str(correct(i)),' guessed the number!']);
        end
        % show the number
        disp(['the number was ', int2str(Picker)]);
    end
    
    % if the game has been terminated ask if they want a new game
    if Guessedcorrectly == 1 || NrGuesses == 10
        NewGame = input('Do you want to play again? y/n ', 's');
        % if they do, reset all variables
        if NewGame == 'y'
            NrGuesses = 0;
            Guessedcorrectly = 0;
            Picker = round(100*rand(1));
        else
            disp('goodbye!')
        end
    end
end
class Hangman

    def initialize
        @word = words.sample
        @lives = 7
        @correct_guesses = []
        @word_teaser = ""

        @word.first.size.times do
            @word_teaser += "_ "
        end
    end

    def words
        [
            ["crikect", "Baseball's evil twin."],
            ["phriend", "Who is this Phelix?"],
            ["hawkeye", "Strongest Avenger."],
            ["scott", "The only thing that can kill Super man."],
            ["cat", "The thing Felix was named after."],
            ["garnet", "Ruby and sapphire."],
            ["clearwater", "That one strange city in Florida."],
            ["scar", "What's on my left eyebrow?"],
            ["supercalifragilisticexpialidocious", "Is that a real word?"],
            ["pneumonoultramicroscopicsilicovolcanoconiosis", "A lung disease caused by the inhalation of very fine silicate or quartz dust, causing inflammation in the lungs."],
            ["bitcoin", "risky investment"],
            ["arizona", "A very hot place."],
            ["gasoline", "More valuble than gold."],
            ["functional", "Object's evil twin."],
            ["jazz", "It gave us soul."]
        ]
    end

    def print_teaser last_guess = nil
        update_teaser(last_guess) unless last_guess.nil?
        puts @word_teaser
    end

    def update_teaser last_guess
        new_teaser = @word_teaser.split

        new_teaser.each_with_index  do |letter, index|
            # replace blank values with letter if matches letter in the word
            if letter == '_' && @word.first[index] == last_guess
                new_teaser[index] = last_guess
            end
        end

        @word_teaser = new_teaser.join(' ')
    end
 
    def make_guess
        if @lives > 0
            puts "Enter a letter"
            guess = gets.chomp.downcase

            # unless guess.match(/^[[:alpha:]]$/)
            #     puts
            #     make_guess
            # end
            
            # if leter is not part of the word then remove from letters array
            good_guess = @word.first.include? guess

            if guess == "exit"
                puts "Thanks for playing!"
            elsif guess.size != 1
                puts "Guess one letter!"
                puts
                make_guess
            elsif !guess.match(/^[[:alpha:]]$/)
                puts "Guess a letter!"
                puts
                make_guess
            elsif @word_teaser.include? guess
                if @lives == 2
                    @lives -= 1
                    puts "Sorry... You have #{ @lives } life left. Try again!"
                    make_guess
                else
                    @lives -= 1
                    puts "Sorry... You have #{ @lives } lives left. Try again!"
                    make_guess
                end
            elsif good_guess
                puts
                puts "You are correct!"

                print_teaser guess
                puts

                if @word.first == @word_teaser.split.join
                    puts "Congrtulations! You have won this round!"
                else
                    make_guess
                end
            else
                if @lives == 2
                    @lives -= 1
                    puts "Sorry... You have #{ @lives } life left. Try again!"
                    make_guess
                else
                    @lives -= 1
                    puts "Sorry... You have #{ @lives } lives left. Try again!"
                    make_guess
                end
            end
        else
            puts "Game over! Your word was #{@word.first}."
        end
    end

    def begin
        puts
        puts "New game started.... Your word is #{ @word.first.size} characters long."
        puts "To exit game at any point type 'exit'"
        puts
        print_teaser

        puts "Clue: #{ @word.last }"

        make_guess
    end
end

game = Hangman.new
game.begin
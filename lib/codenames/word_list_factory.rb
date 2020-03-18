require 'app/models/codenames/word'

module Codenames
  class WordListFactory
    def build_word_list(first_move:, number_of_words: 25)
      words = WORDS.sample(number_of_words)

      second_move = first_move == Codenames::WordOwner::Blue ? Codenames::WordOwner::Red : Codenames::WordOwner::Blue

      player_moves = Array.new(5, first_move).zip(Array.new(4, second_move)).flatten.compact

      [].tap do |word_list|
        player_moves.each do |player|
          word = take_word(words)

          insert_random(build_word(word, player), word_list)
        end

        insert_random(build_word(take_word(words), Codenames::WordOwner::Assassin), word_list)

        words.each do |word|
          insert_random(build_word(word, Codenames::WordOwner::Neutral), word_list)
        end
      end
    end

    private
    def build_word(word, owner)
      Codenames::Word.new(word: word, owner: owner)
    end

    def take_word(list)
      list.delete(list.sample)
    end

    def insert_random(word, word_list)
      range = 0..(word_list.size)

      word_list.insert(rand(range), word)
    end

    WORDS = %w[
      Hollywood Well Foot Spring Court Tube Point Tablet Slip Date Drill Lemon Bell
      Screen Fair Torch State Match Iron Block France Australia Limousine Stream Glove Nurse Leprechaun
      Play Tooth Arm Bermuda Diamond Whale Comic Mammoth Green Pass Missile Paste Drop Pheonix
      Marble Staff Figure Park Centaur Shadow Fish Cotton Egypt Theater Scale Fall Track Force
      Dinosaur Bill Mine Turkey March Contract Bridge Robin Line Plate Band Fire Bank Boom
      Cat Shot Suit Chocolate Roulette Mercury Moon Net Lawyer Satellite Angel Spider Germany Fork
      Pitch King Crane Trip Dog Conductor Part Bugle Witch Ketchup Press Spine Worm Alps
      Bond Pan Beijing Racket Cross Seal Aztec Maple Parachute Hotel Berry Soldier Ray Post
      Greece Square Mass Bat Wave Car Smuggler England Crash Tail Card Horn Capital Fence
      Deck Buffalo Microscope Jet Duck Ring Train Field Gold Tick Check Queen Strike Kangaroo
      Spike Scientist Engine Shakespeare Wind Kid Embassy Robot Note Ground Draft Ham War Mouse
      Center Chick China Bolt Spot Piano Pupil Plot Lion Police Head Litter Concert Mug
      Vacuum Atlantis Straw Switch Skyscraper Laser Africa Plastic Dwarf Lap Life Honey Horseshoe
      Unicorn Spy Pants Wall Paper Sound Ice Tag Web Fan Orange Temple Canada Scorpion
      Undertaker Mail Europe Soul Apple Pole Tap Mouth Ambulance Dress Rabbit Buck Agent
      Sock Nut Boot Ghost Oil Superhero Code Kiwi Hospital Saturn Film Button Snowman Helicopter
      Log Princess Time Cook Revolution Shoe Mole Spell Grass Washer Game Beat Hole
      Horse Pirate Link Dance Fly Pit Server School Lock Brush Pool Star Jam Organ
      Berlin Face Luck Amazon Cast Gas Club Sink Water Chair Shark Jupiter Copper Jack
      Platypus Stick Olive Grace Bear Glass Row Pistol London Rock Van Vet Beach Charge
      Port Disease Palm Moscow Pin Washington Pyramid Opera Casino Pilot String Night
      Chest Yard Teacher Pumpkin Thief Bark Bug Mint Cycle Telescope Calf Air
      Box Mount Thumb Antactica Trunk Snow Penguin Root Bar File Hawk Battery
      Compound Slug Octopus Whip America Ivory Pound Sub Cliff Lab Eagle Genious
      Ship Dice Hood Heart Novel Pipe Himalayas Crown Round India Needle Shop
      Watch Lead Tie Table Cell Cover Czech Back Bomb Ruler Forest Bottle
      Space Hook Doctor Ball Bow Degree Rome Plane Giant Nail Dragon Stadium
      Flute Carrot Wake Fighter Model Tokyo Eye Mexico Hand Swing Key Alien
      Tower Poison Cricket Cold Knife Church Board Cloak Ninja Olympus Belt Light
      Death Stock Millionarie Day Knight Pie Bed Circle Rose Change Cap Triangle
    ]
  end
end
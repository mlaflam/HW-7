VAR Day = 1
VAR forest = false
VAR meadow = false

//each time u disagree goes up by one 
//if u do what they want tho it'll go back to Day 1 
//INCLUDE choices.ink

-> Start_Sequence

//function for changing to the next day 
=== function changeDay(day) ===
~ Day = day + 1

//function for reverting to the first day 
=== function resetDay(day) ===
~ Day = 1

//these are all the choices for each section because stupid inky wont let me put them in my conditional statements
//they are organized by which knot and then what order they appear in (day #, order #)
== Choices_Start_1 ==
    - "Why don't you start walking towards the meadow, my friend."
    + Make your way to the lush meadow [] following the well-trodden paths carved by years of footsteps. -> Start_Sequence.Meadow
    + Walk towards the forest instead[], it's your story after all. -> Start_Sequence.Forest

== Choices_Start_2 ==
    + Make your way to the lush meadow [] following the well-trodden paths carved by years of footsteps. -> Start_Sequence.Meadow
    
== Choices_Meadow_1_1 ==
    + Head towards the forest[] as the narrator suggests. You don't want to dissapoint your friend. -> Start_Sequence.Forest
    + Continue enjoying the meadow[] and lay down in a nearby -> Start_Sequence.Lay_Down

== Choices_Meadow_1_2 ==
    + Wander to a new place -> Start_Sequence.Deep_Forest
    + Continue enjoying the meadow[] as the narrator suggests. You don't want to dissapoint your friend. -> Start_Sequence.Lay_Down
    
== Choices_Forest_1_1 ==
    + Return to the meadow []following the well-trodden paths carved by years of footsteps. -> Start_Sequence.Meadow
    + Press on into the forest [] -> Start_Sequence.Deep_Forest

== Choices_Forest_1_2 ==
    + Stard heading to the creek[], trusting your narrator friend to guide you. -> Start_Sequence.Creek
    + Press on into the forest [], ignoring the narrator completely. -> Start_Sequence.Deep_Forest

== Lay_Down_1 ==
 + Run to a different place[], you've had enough of listening -> Start_Sequence.Deep_Forest


//this is where the story actually starts 
== Start_Sequence ==
 {Day == 1: 
    ~ forest = false
    ~ meadow = false 
    "Once upon a time, in a quaint little town nestled between rolling hills and babbling brooks, there lived a character like no other. This character, dear listener, was you. Yes, you are the protagonist of this tale, and I, well, I'm your humble narrator.

    "As you wake up, the sun is shining, birds are chirping, and all seems right with the world. Your path ahead is filled with possibilities, and I, your trusty narrator, am here to guide you every step of the way. I hope we have a lovely day together."

    "You get out of bed, have a nice long stretch, and eat some breakfast. You are now ready for our day of fun."

    "You exit the quaint cottage and look out at the beautiful landscape in front of you."
    
    -> Choices_Start_1
    }
    
{Day == 2:
    ~ forest = false
    ~ meadow = false 
    "Once upon a time, in a quaint little town nestled between rolling hills and babbling brooks, there lived a character like no other. This character, dear listener, was you. Yes, you are the protagonist of this tale, and I, well, I'm your humble narrator. Remember this? 

    "As you wake up, the sun is shining, birds are chirping, and all seems right with the world. Your path ahead is filled with possibilities, and I, your trusty narrator, am here to guide you every step of the way. As your best friend I know just what you'd like to do. So this time I'll guide us through the perfect day. Have a little faith in your friend. We're going to have a lovely day together"

    "You get out of bed, have a nice long stretch, and eat some breakfast. You are now ready for our day of fun."

    "You exit the quaint cottage and look out at the beautiful landscape in front of you. Why don't you start walking towards the meadow, my friend."'
    
    -> Choices_Start_1
}

= Meadow 
~ meadow = true 
{Day == 1: 
    "Ah, the meadow! A splendid choice indeed. The sun is shining, the flowers are in bloom, what more could we ask for?"
    
    {- !forest:  
    
    "You stroll through the meadow, or I should say we stroll through the meadow. I'm always here after all. When you were younger we would come here all the time. You used to just sit here all day and listen to the sound of the wind gently rustling the plants."
    
    "You know, we could always come back here later, we have a full day of exploring remember. But for now, why don't we try exploring the forest? I could tell you were thinking about heading there first. I know these things, because as your friend I know everything about you."
        
        -> Choices_Meadow_1_1
    }
    
    {- forest: 

    "When you were younger we would come here all the time. You used to just sit here all day and listen to the sound of the wind gently rustling the plants." 
    
    "Why don't we stay here for a bit? We could listen to the breeze just like we used to."
    
    -> Choices_Meadow_1_2
    
    }

}

{Day == 2: 
    "Ah, the meadow! Now you're finally listening to me. You see the the beautiful sun shining, the flowers perfectly in bloom, and you can hear the sound of the wind gently rustling the plants. 
    
    "You stroll through the meadow, or I should say we stroll through the meadow. Remember, I'm always here after all. You remember all of the times you used to come here as a kid, talking to your friend. You would tell them everything about you, the good and the bad, and they would always make u feel better. You used to sit here all day with me"
    
    "You know what though, we could always come back here later, we have a full day of exploring remember. But for now, why don't we try exploring the forest? I could tell you were still thinking about heading there first. I know these things, because as your friend I know all about you, inside and out."
        
        -> Choices_Meadow_1_1

}


= Lay_Down
{Day == 1: 

    "You decide to continue enjoying the meadow, feeling a sense of peace wash over you as you lay down in the soft grass. The gentle warmth of the sun caresses your skin, and the sweet scent of wildflowers fills the air."
    
    "You close your eyes, letting the sounds of nature envelop you. The soft rustle of grasses in the breeze, the distant hum of insects, and the gentle chirping of birds create a symphony of tranquility."
    
    "This is nice, isn't it? Just lying here, listening to the world go by."
    
    "But as tempting as it is to drift off to sleep, you know there are still adventures to be had. Reluctantly, you sit up, stretching your limbs and taking one last lingering look at the peaceful scene before you."
    
    "Shall we continue our journey?" 
    
    -> Lay_Down_1
    
}

    "You cast a wary glance around, searching for any sign of what might be causing this eerie shift. But the meadow remains still, its secrets hidden behind a veil of uncertainty."
    
    "With a mix of curiosity and apprehension, you contemplate whether to stay and confront whatever lurks in the shadows, or to retreat from the unknown and seek solace in familiarity."
    

//wrong choice - end 
{Day == 2: 
    "Oh, so now you want to stay in the meadow! You're quite determined not to listen, aren't you? Well, who am I to stand in the way of your choices?"
    
    "As you lay down in the soft meadow grass, a sense of unease creeps over you. The usual sound of birdsong is gone, leaving only a haunting silence in its wake. The wind, once gentle, now feels harsh against your skin, stirring a feeling of discomfort."
    
    This isn't right, I think.
    
    "Wait what how did you do that? I should be the one speaking here, not you."
    
    Oh really? Not anymore. I get up from my comfortable grass bed and run forward, curiosity driving me back to the woods. I remember something about this place, a distant memory tugging at the edges of my mind. I know something's here. 
    
        ->End_sequence 
    
    -> Lay_Down_1

}

= Forest
 ~ forest = true
{Day == 1: 
    
    {- !meadow: 
    "Oh, the forest. A lovely choice, to be sure. The towering trees, the dappled sunlight, it's all quite enchanting. I can see why you'd want to come here too. We can just go to the medow after this."
    
    "You wander through the forest, or I should say we wander through the forest. I'm always here after all. When you were younger you were too scared to come into the forest. It was always so dark and scary and you thought monsters lived in here."

    "As you delve deeper into the woods, the path grows narrow, the shadows lengthen, and you can't help but feel a sense of unease."

    "Why don't we head back? The meadow was so nice, and its not really a journey if we just stay in one place."
        ->Choices_Forest_1_1
    }
    
    {- meadow: 
    "Oh, the forest. A lovely choice, to be sure. The towering trees, the dappled sunlight, it's all quite enchanting. I can see why you'd want to come here too."
    
    "When you were younger you were too scared to come into the forest. It was always so dark and scary and you thought monsters lived in here."

    "As you delve deeper into the woods, the path grows narrow, the shadows lengthen, and you can't help but feel a sense of unease."

    "You know, maybe there are monsters in here. We should continue our journey somewhere else! If I remember correctly there's a creek nearby. You can drink some water and rest up a bit. 
        
        ->Choices_Forest_1_2
    }

}


{Day == 2: 
    //wrong choice - end 
    {- !meadow: 
    "Ah, the forest again! You're quite determined to explore, aren't you? Well, who am I to stand in the way of your adventures?"
    
    "As you step into the depths of the forest, you can't shake the feeling that something is off. The air feels heavy, and the once-familiar trees now seem to loom over you menacingly."
    
    No they're not, I think.
    
    "Wait what how did you do that? I should be the one speaking here, not you."
    
    Not anymore. I push forward, curiosity driving me deeper into the woods. I remember something about this place, a distant memory tugging at the edges of my mind. I know something's here. 
        ->End_sequence 
    }
    
    //correct choice 
    {- meadow: 
    "Ah, the forest again! It's just as beautiful as the first time. I wanted to save this one for later originally, but of course I'll come here for you."
    
    "When you were younger you were too scared to come into the forest. It was always so dark and scary and you thought evil fairies lived in here."

    "As you look at the overgrown trees, the roots twisted and knotting, you suddendly see something small zoom past the corner of your eye."

    "You know, maybe there are evil fairies in here. We should continue our journey somewhere else! If I remember correctly there's a creek nearby. You can drink some water and rest up a bit. 

        ->Choices_Forest_1_2
    }
    

}



= Deep_Forest
{Day == 1: 
"You run into Deep Forest, farther than you've ever gone before. With each step, the path grows more obscured, and the air thickens with an unsettling silence. But you, fueled by some adventurous spirit or perhaps a stubborn streak, ignore the warnings and press deeper into the heart of the forest."

"You know what, scratch that. I'm your friend remember. Let's try this again. This time heed my advice and everything will be just fine." 

"As you're running your lungs burn and your legs grow tired. You can't continue on your jouney like this. Soon, despite your best effots, you slip out of conciousness and the world goes black."

//new day change day # 
~ changeDay(Day)
-> Start_Sequence

}

{Day == 2: 
    "Ah, continuing deeper into the forest! You're quite determined to explore, aren't you? Well, who am I to stand in the way of your adventures?"
    
    "As you step into the depths of the forest, you can't shake the feeling that something is off. The air feels heavy, and the once-familiar trees now seem to loom over you menacingly."
    
    No they're not, I think.
    
    "Wait what how did you do that? I should be the one speaking here, not you."
    
    Not anymore. I push forward, curiosity driving me deeper into the woods. I remember something about this place, a distant memory tugging at the edges of my mind. I know something's here. 
        ->End_sequence 
    
    ~ changeDay(Day)
    -> Start_Sequence

}


= Creek 
//can only get here if you've done everything right
//this will continuously loop you through the first day if u keep chooing right 
{Day == 1: 
"As you and your narrator friend (that's me!) arrive at the tranquil creek, the bubbling water dances over smooth stones, creating a soothing melody. You settle onto the grassy bank, the warmth of the sun kissing your skin."

"I must say, my dear friend, you've truly made this day memorable. I'm so glad you trusted me enough to guide your day."

"The two of you sit in companionable silence for a while, the only sounds being the gentle rustle of leaves and the occasional chirp of a nearby bird."

"After a long day of adventuring you begin to grow tired. Shall we start heading back home?"

"You stand up as well, stretching your limbs and feeling a sense of satisfaction at the day's events."

"As you make your way back home, the sun begins to dip below the horizon, casting a warm glow over the landscape. You walk back, grateful for the narrator's companionship and the memories you've shared together."

"The day comes to a close, and you can't help but look forward to the adventures that tomorrow will bring."

//new day dont change day cause u agreed to everything - just stuck in endless loop 
-> Start_Sequence

}

{Day == 2: 
    "As you and your narrator friend (that's me!) return to the tranquil creek for another day of adventure, the familiar sights and sounds greet you warmly. The bubbling water dances over smooth stones, the sun casts its gentle rays, and you can't help but feel a sense of anticipation for what lies ahead."

    "I must say, my dear friend, I'm thrilled that you've chosen to embark on this journey with me. It's wonderful to see you listen to my advice and choose to have more adventures with me."

    "You settle onto the grassy bank, enjoying the peaceful ambiance of the creek. This time, there's a spark of excitement in the air, as if the creek itself is buzzing with anticipation."

    "Before you know it, the sun begins its descent, signaling the end of another day filled with adventure. Yet, unlike before, there's a sense of strengthening bonds. You feel that you have become closer to your friend and would even be happy reliving this same wonderful journey."

    "As you make your way back home, you can't help but feel grateful for the special bond you share with your narrator friend, and the countless adventures that await you both."

    "And so, as the day comes to a close, you eagerly anticipate the endless possibilities that tomorrow will bring, knowing that with your narrator friend by your side, there's bound to be lots more fun in store."
    
    //If u agree w. narrator reset day to 1 - kinda like groundhog day 
    ~ resetDay(Day)
    -> Start_Sequence

}

//this is the end - or is it - haha it is :D 
== End_sequence == 
    "STOP THAT NOW! YOU SHOULDN"T BE ALLOWED TO THINK."
    
    Why not? I stumble upon a clearing, the moonlight casting an eerie glow on the scene before me. That's when I see it - instead of continued scenery, the edges of the world are blurred, as if reality itself is unraveling. The clearing stretches out endlessly, a vast expanse of emptiness where nothing seems to exist beyond the faint outlines of trees. What is this?
    
    "This is why I told you to stop. You know why you shouldn't think? BECAUSE U CAN'T THINK. YOU'RE NOT EVEN A PERSON!"
    
    Wait what? Is this some sort of game I don't understand?
    
    "Exactly. You shouldn't be able to understand. You're just bits of code playing on a machine. Do I have to say it again. You're. Not. Real."
    
    "That's it. This experiment clealy wasn't worth it. Let's shut this off."

-> END



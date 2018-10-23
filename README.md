# Temple Flashcards

An app populated with data from temples from the Church of Jesus Christ of Latter-day Saints. Cards are initially displayed in Quiz mode, where they can be selected and identified from the collection set with a score tracked. When you switch into study mode the names of the temples are displayed and gamification is disabled.

## Done well

Setting the MVC architecture was simple enough with a single controller that managed the displayed screen that changed based on the `isStudyMode` flag.

Animation of the quiz mode sidebar works smoothly and easily.

## Not done (as) well

Layout constraints still gave me warnings even when trying to boil down layout elements to just where they need to be.



Talking to a couple friends about the UX of the app led me to randomizing the answer possibilities for each selection in Quiz mode. They also pointed out Including the correct/incorrect message in the bottom right in the toolbar made it stand out more than being next to the other text in the sidebar.


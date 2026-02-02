import { application } from "./application"

import DropdownController from "./dropdown_controller"
import FlashController from "./flash_controller"
import LivesController from "./lives_controller"
import ExerciseController from "./exercise_controller"
import MultipleChoiceController from "./multiple_choice_controller"
import FillBlankController from "./fill_blank_controller"
import TrueFalseController from "./true_false_controller"
import OrderWordsController from "./order_words_controller"
import ConnectPairsController from "./connect_pairs_controller"
import QuickQuizController from "./quick_quiz_controller"
import ChooseVerseController from "./choose_verse_controller"
import SequenceStoryController from "./sequence_story_controller"
import ConfettiController from "./confetti_controller"
import XpCounterController from "./xp_counter_controller"
import ProgressBarController from "./progress_bar_controller"

application.register("dropdown", DropdownController)
application.register("flash", FlashController)
application.register("lives", LivesController)
application.register("exercise", ExerciseController)
application.register("multiple-choice", MultipleChoiceController)
application.register("fill-blank", FillBlankController)
application.register("true-false", TrueFalseController)
application.register("order-words", OrderWordsController)
application.register("connect-pairs", ConnectPairsController)
application.register("quick-quiz", QuickQuizController)
application.register("choose-verse", ChooseVerseController)
application.register("sequence-story", SequenceStoryController)
application.register("confetti", ConfettiController)
application.register("xp-counter", XpCounterController)
application.register("progress-bar", ProgressBarController)

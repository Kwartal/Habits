//
//  UIColor + App.swift
//  Doodze
//
//  Created by Богдан Баринов on 11.11.2022.
//

import UIKit

struct RingColors {

    let start: UIColor
    let end: UIColor
    let background: UIColor

}

extension UIColor {

    static let childColors: [UIColor] = [.calendarEventsPriority1, .calendarEventsPriority2, .calendarEventsPriority3, .calendarEventsPriority4, .calendarEventsPriority5, .calendarEventsPriority6]
    static let storiesBackground = unwrappedColor(from: Color.storiesBackground())

    // MARK: - Light

    // MARK: - General Icons

    static let iconsPrimary = unwrappedColor(from: Color.violet50())
    static let iconsIntelligence = unwrappedColor(from: Color.blue50())
    static let iconsSport = unwrappedColor(from: Color.rose50())
    static let iconsSecondary = unwrappedColor(from: Color.white())
    static let iconsTertiary = unwrappedColor(from: Color.violet20())
    static let iconsQuaternary = unwrappedColor(from: Color.gray30())
    static let iconsPositive = unwrappedColor(from: Color.green50())
    static let iconsNegative = unwrappedColor(from: Color.red50())
    static let iconsWeekend = unwrappedColor(from: Color.red60())

    static let iconsLamp = unwrappedColor(from: Color.yellow50())
    static let iconsBlack = unwrappedColor(from: Color.iconsBlack())

    // MARK: - General Text

    static let textPrimary = unwrappedColor(from: Color.gray100())
    static let textSecondary = unwrappedColor(from: Color.white())
    static let textTapPrimary = unwrappedColor(from: Color.violet50())
    static let textTertiary = unwrappedColor(from: Color.gray80())
    static let textQuaternary = unwrappedColor(from: Color.violet30())
    static let textPositive = unwrappedColor(from: Color.green50())
    static let textNegative = unwrappedColor(from: Color.red50())
    static let textIntelligence = unwrappedColor(from: Color.blue50())
    static let textSport = unwrappedColor(from: Color.rose50())
    static let textNotebookMenstruations = unwrappedColor(from: Color.red50())
    static let textNotebookExcretions = unwrappedColor(from: Color.violet50())
    static let textNotebookMood = unwrappedColor(from: Color.orange80())
    static let textNotebookSexLife = unwrappedColor(from: Color.rose30())

    // MARK: - General Background

    static let backgroundPrimary = unwrappedColor(from: Color.white())
    static let backgroundSecondary = unwrappedColor(from: Color.gray10())
    static let backgroundTertiary = unwrappedColor(from: Color.violet10())
//    static let backgroundNavigation = unwrappedColor(from: Color.as())
    static let backgroundPositive = unwrappedColor(from: Color.green10())
    static let backgroundSeparator = unwrappedColor(from: Color.gray20())

    // MARK: - Buttons Text

    static let buttonTextPrimary = unwrappedColor(from: Color.white())
    static let buttonTextSecondary = unwrappedColor(from: Color.violet50())

    // MARK: - Buttons Background

    static let buttonBackgroundPrimary = unwrappedColor(from: Color.violet50())
    static let buttonBackgroundSecondary = unwrappedColor(from: Color.white())
    static let buttonBackgroundTertiary = unwrappedColor(from: Color.gray10())
    static let buttonBackgroundCycle = unwrappedColor(from: Color.rose50())
    static let buttonBackgroundChild = unwrappedColor(from: Color.blue50())
    static let buttonBackgroundMarkCycle = unwrappedColor(from: Color.red50())

    // MARK: - Calendar Events

    static let calendarEventsPriority1 = unwrappedColor(from: Color.rose50())
    static let calendarEventsPriority2 = unwrappedColor(from: Color.blue50())
    static let calendarEventsPriority3 = unwrappedColor(from: Color.rose40())
    static let calendarEventsPriority4 = unwrappedColor(from: Color.green50())
    static let calendarEventsPriority5 = unwrappedColor(from: Color.blue20())
    static let calendarEventsPriority6 = unwrappedColor(from: Color.orange80())
    static let calendarEventsOvulation = unwrappedColor(from: Color.blue50())
    static let calendarEventsWeekend = unwrappedColor(from: Color.red60())
    static let calendarEventsCycle = unwrappedColor(from: Color.red50())
    static let calendarEventsCycleCircle = unwrappedColor(from: Color.violet15())

    // DARK: -

    static let iconsDarkPrimary = unwrappedColor(from: Color.violet40())
    static let iconsDarkIntelligence = unwrappedColor(from: Color.blue40())
    static let iconsDarkSport = unwrappedColor(from: Color.rose30())

    static let backgroundDarkPrimary = unwrappedColor(from: Color.violet100())
    static let buttonBackgroundDarkPrimary = unwrappedColor(from: Color.violet40())
    static let buttonBackgroundDarkSecondary = unwrappedColor(from: Color.violet80())

    // MARK: - Shadows

    static let trackers20 = unwrappedColor(from: Color.trackers20())
    static let buttonSheet = unwrappedColor(from: Color.buttonSheet())

    // MARK: - Grabber

    static let grabberDark = unwrappedColor(from: Color.grabberDark())

    // MARK: - Ring Colors

    static let intellegenceEndColor = UIColor(47, 85, 219)
    static let sportEndColor = UIColor(157, 45, 225)
    static let cognitionEndColor = UIColor(102, 45, 225)

    // MARK: Notebook Colors

    static let textNotebookSymptoms = unwrappedColor(from: Color.violet50())

    static let intellegenceRing = RingColors(
        start: unwrappedColor(from: R.color.intellegenceStart()),
        end: unwrappedColor(from: R.color.intellegenceEnd()),
        background: unwrappedColor(from: R.color.intellegenceBackground())
    )

    static let sportRing = RingColors(
        start: unwrappedColor(from: R.color.sportStart()),
        end: unwrappedColor(from: R.color.sportEnd()),
        background: unwrappedColor(from: R.color.sportBackground())
    )

    static let cognitionRing = RingColors(
        start: unwrappedColor(from: R.color.cognitionStart()),
        end: unwrappedColor(from: R.color.cognitionEnd()),
        background: unwrappedColor(from: R.color.cognitionBackground())
    )

    // MARK: - Social Media

    enum SocialMediaBackground {
        static let google = UIColor.unwrappedColor(from: Color.googleBackground())
        static let facebook = UIColor.unwrappedColor(from: Color.facebookBackground())
        static let vk = UIColor.unwrappedColor(from: Color.vkBackground())
        static let apple = UIColor.unwrappedColor(from: Color.appleBackground())
    }

    private static func unwrappedColor(from optionalColor: UIColor?) -> UIColor {
        return optionalColor ?? UIColor()
    }

}

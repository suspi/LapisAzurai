Person.alias.K = 'Kat'
Person.Kat =
  name: 'Kat'
  img: 'people/Kat/Normal'
  svg: 'people/Kat/skills.svg'
  skills:
    Bright:
      description: 'Events grant +1 experience to a random participant'
      doubledBy: 'Regret'
    Generous:
      description: 'Events grant +1 experience to a random non-participant'
      doubledBy: 'Regret'
    SixthSense:
      name: 'Sixth Sense'
      description: "See events two days before they're available"
      doubledBy: 'Regret'
    StreetRat:
      name: 'Street Rat'
      description: "Unlock Kat's events after prologue"
      requiresAnd: ['Bright', 'Generous', 'SixthSense']

    HowNotToLose:
      name: 'How Not To Lose'
      description: 'Events cost -1 Reputation'
      requiresAnd: ['StreetRat']
      doubledBy: 'Regret'
    NeverTooLate:
      name: 'Never Too Late'
      description: 'Events last an additional day'
      requiresAnd: ['StreetRat']
      doubledBy: 'Death'
    Devilish:
      description: '50% change to discard an expired cargo when completing another one'
      requiresAnd: ['StreetRat']
      doubledBy: 'Death'
    Deckhand:
      description: "Unlock Kat' route"
      requiresAnd: ['HowNotToLose', 'NeverTooLate', 'Devilish']

    Bright2:
      name: 'Bright 2'
      description: 'Events grant +1 experience to a random participant'
      requiresAnd: ['Deckhand']
      doubledBy: 'Death'
    Generous2:
      name: 'Generous 2'
      description: 'Events grant +1 experience to a random non-participant'
      requiresAnd: ['Deckhand']
      doubledBy: 'Death'
    SixthSense2:
      name: 'Sixith Sense 2'
      description: "See events two days before they're available"
      requiresAnd: ['Deckhand']
      doubledBy: 'Desire'
    FreeWoman:
      name: 'Free Woman'
      description: "Unlock Kat's ending (also requires Mage on Natalie)"
      requiresAnd: ['Bright2', 'Generous2', 'SixthSense2']

    HowNotToLose2:
      name: 'How Not To Lose 2'
      description: 'Events cost -1 Reputation'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
    NeverTooLate2:
      name: 'Never Too Late 2'
      description: 'Events last an additional day'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'
    Devilish2:
      name: 'Devlish 2'
      description: '50% chance to discard an expired cargo when completing another one'
      requiresAnd: ['FreeWoman']
      doubledBy: 'Desire'

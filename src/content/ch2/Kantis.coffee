s = {}

s.KantisArrive =
  label: 'Arrival'
  blocking: true
  required: 'GameOverExploration'
  extraDays: 30
  history:
    KantisRegion3: true
  effects:
    xp:
      Natalie: 3
  text: ->"""
  || places/KantisDay
    Even from afar, Kantis was an impressive sight. Nearly surrounding a circular harbor, the city rose so smoothly out of the water that seemed shaped intentionally, rather than a natural formation. Perhaps it had been, some time in the distant past. Most of the buildings were the same pure white stone as the streets, blinding in the sun. It was a work of art.

    A closer approach bellied the impression. If the city was a work of art, it was a disorderly one. Three different docks hailed the Lais, each vying for Natalie's attention. She shaded her eyes, and after a moment's instpection, pciked the one closer to the harbor's entrance. Less crowded with ships. Further from a trio of well armed vessels flying Colinth's colors.

    The harbormaster - of dockmaster rather, since he clearly wasn't in chance of the whole harbor - fingered an amulet as they approached. ` Natalie Rowena?`

    `N That's me!` She jumped down to the dock along with the first thrown ropes, leaving James to manage tying off the ship.

    ` Welcome to Kantis.`

    `N Harbor fees?`

    ` None. You're a guest of House Apollon.`

    Natalie crossed her arms. `N Am I. What exactly does that entail?`

    ` You'll have to ask lord Elakim. All I know is that he instructed me to dock you freely. Please let me know if there's anything you might need, I'm alslo to provide all reasonable assistance. Have a nice stay.`
  """

s.VisitElakim =
  label: 'Visit Elakim'
  required: 'GameOverPower'
  history:
    KantianSorcerer: true
  effects:
    xp:
      Natalie: 5
  text: -> """
  || places/KantisDay
    Near the water Kantis was a city like any other, but as Natalie climbed higher up the slope surrounding the harbor, there was a wall. On one side things were noisy, commercial, disorderly, as if the people were frantic to make a sale. Passing under the arch, she ran face first into a wall of silence. Instead of streets and buildings, she faced footpaths and gardens, manicured trees and open space. Two of the four gate guards came over. Four seemed a rather large number of armed men to be keeping watch in a peaceful city.

    ` Can I help you?`

    `N I'm looking for House Appolon?`

    The guard's expression flickered, and Natalie felt his friendliness evaporating. ` What's your business with them?`

    `N I have an audience.` Not entirely true, but she wasn't going to reveal her intentions when asked in that tone.

    ` Two gates east. This is Hoes Peland.` His companion muttered something about meddling Vailians, and Natalie took her leave before they could make up  their minds to do something more than grumble.

  || places/KantisGarden
    The reception at House Appolon's gate was far more cordial, with a servant waiting to guide her to an immediate meeting with the master of the house. The way to tha manor house led them through a small orchard. The estate was immense, especially nestled as it was right next to a dense city, where so many others could have profitably used the space.

    As before, the felt the presence of another mage before she saw him. Elakim Appolon was waiting for her on a patio, magic coiled around him, controlled and ready. He stood as she approached.

  || Elakim/Serious
    `Elakim Welcome to my summer estate. I'm glad to hear you landed at my pier. I hope they treated you well?` His accent was thicker than other Kantians. Probably a mark of status or nobility, Natalie decided.

    `N Very kind of you, thanks. I came to ask what exactly being your guest entails, though. Our last meeting was rather short-lived to have inspired such generosity on your part.`

    `Elakim Spoken like a true Vailian, more concerned about a few coins than about making friends in a foreign city.` He laughed, a sound she found difficult to interpret.

    `N That's what I came to find out, whether it was friendship or ulterior motives which moved you on my behalf.`

    `Elkaim Ulterior motives, of course. We lords of Kantis are no less grasping of any advantage against our peers than you, but we're accustomed to cloaking it behind noble sentiments. Many in the city find the honesty of the Vailian obsession with money and power disconcerting. Please, sit.`

    Natalie coughed politely, attempting to hide her dismay. She took a seat across from him, the freshly woved wicker chair accepting her weight without complaint. Was that how she came across, obsessed with money and power? Was that how outsiders saw the Guild? `N I suppose it I'm given the mask, I may as well wear it. What do you hope to gain?`

    `Elakim I don't know yet, but it did seem prudent to keep you out of my rivals' hands. You're potentially quite valuable, you know - and alas, also quite vulnerable. A powerful, untrained mage without heir or family? Extending my protection and patronage was the only honorable thing to do. It was a stroke of fortune that you met me in Colinth, rather than one of the other lords. I already have an heir, and he's far too young for a bride.`

  || N/Upset
    Natalie blanched at the implication. She was here alone. Why had she come alone? James - or better yet Asara - shou should be at her side. Whatever power the priestess held, it ought to be enough to make even a mage-lord think twice before harassing her. `N The Guild is not to be triffled with,` she forced an even tone, grasping for some manner of outside authority to hold as a shield.

    `Elakim Vailia's power may be waxing, but we are not yet overshadowoed in our own home,` Elakim frowned. `Elakim You have nothing to worry about from me. And as long as you don't make yourself too tempting a target, I doubt any of the other lords will risk my wrath by troubling you. Keep your friends close, Natalie. Kantis is not a safe place without allies to watch your back. I hope that someday you will count me among them.`
  """


s.KantisPots =
  label: 'Pots, Pans and Complaints'
  history:
    VisitElakim: true
  effects:
    xp:
      James: 3
  text: -> """
  || places/KantisDay
    `J Can you believe the price of this?` James hefted the pot under his arm, replacement for one lost overboard during an unfortunate scuffle between two of the crew.

    `N Hm? Seemed about fair to me.` Natalie responded absentmindedly, busy checking her notes on what the ship needed. On a larger vessel this would have been the quartermaster's job, but she and James shared that role as time allowed.

    `J About fair for a sturdy Vailian pot, sure. But feel it, the texture's wrong. That means the metal's brittle. I'll be surprised if it lasts more than six months. They probably got some ash in the ingots and...`

    `N You can take the James out of smithy, but you can't take the smithy ouf of James,` she inturrupted his rant with a grin and a ringing slap on the pot. `N No complaining. If they made pots like we do, we wouldn't be making money bringing Vailian pots here. Oh, come on, stop making that face and keep an eye out for good canvas. I want to lay in a better store in case we run into another storm like that last one.`
  """

s.KatsDayOut =
  label: "Kat's day out"
  history:
    VisitElakim: true
  effects:
    xp:
      Kat: 2
  text: -> """
  || places/KantisDay
    The higher one went in Kantis the nicer things became. Away from the noise and stink of the waterfront districts, the city was an entirely pleasant place. Up here the white marble was washed clean by the rain. The beggars and homeless were kept in check by patrols answering to the lords of Kantis, the mages ruling over the city from their high villas.

    Regardless of the cause, Kat found it a pleasant place to take a walk. Strangers nodded at her (even if some of them did whisper unkind things about Vailians), guards didn't hassle her, and there was quiet and space aplenty. She'd missed that since her homeless days. Life aboard a ship was constantly busy and always crowded. Now, without the poverty and constant fear that had made her childhood so unpleasant it was relaxing indeed.

    For the moment at least she was content to wander. The driving, restless spark was quiet. She imagined what the others would make of that, of manic Kat just enjoying a quiet walk by herself. James wouldn't believe it. She started making a crazy escapade to tell him. An attempted robbery, scuffle with the city guards and harrowing chase across the city roofs? She grinned. He'd totally believe that of her.
  """

Place.Kantis.stories.Ch2 = Object.keys(s)
for key, value of s
  value.place = 'Kantis'
  Story[key] = value

$.extend Person, {
  quote: (ignore, name, text)->
    unless Person[name] then name = Person.alias[name]
    "<q class=#{name}>#{text}</q>"

  drawOverview: ->
    """<div class="people">
      #{Object.keys(g.people).map(Person.draw).join('\n')}
    </div>"""

  draw: (person)->
    xp = g.people[person].xp
    level = Person.level(xp)
    needed = Person.xpNeeded(level + 1)
    skillPoints = Person.skillPoints(person)

    s = if skillPoints is 1 then '' else 's'

    return """<div person="#{person}" class="person">
      <img src="game/content/#{Person[person].img}.png">
      <div>
        <div class="name">#{Person[person].name}</div>
        <div class="description">Level #{level} (#{needed - xp}xp needed for level #{level + 1})</div>
      </div>
      <div class="picks #{if skillPoints > 0 then 'active' else ''}">#{skillPoints} skill point#{s} remaining</div>
      <object data="game/content/#{Person[person].svg}"></object>
    </div>"""

  activateDrawings: (element)->
    $('object', element).on 'load', ->
      svg = @contentDocument
      personElement = $(@).parent()
      person = personElement.attr('person')
      # 1 = aura
      # 2 = outline
      # 3 = fill
      $('g circle:nth-child(3)', svg).css('display', 'none')
      for skill of g.people[person].skills
        $("##{skill} circle:nth-child(3)", svg).css('display', 'initial')

      $('g', svg).on 'click', ->
        element.find('object').each ->
          $(@contentDocument).find('.active').removeClass('active')
        $(@).addClass('active')

        element.find('.skill').remove()
        personElement.after(Person.drawSkill(person, @id))

      $('g', svg).hover ->
        element.find('.skill.mouse-over').remove()
        skill = $(Person.drawSkill(person, @id)).addClass('mouse-over')
        personElement.after(skill)
      , ->
        if element.find('.skill').length > 1
          element.find('.skill.mouse-over').remove()

  drawSkill: (person, skill)->
    data = Person[person].skills[skill]
    selected = g.people[person].skills[skill]

    selectButton = if selected
      '<button disabled>Already selected</button>'
    else if Person.unmetRequirements(person, skill)
      "<button disabled>Requires #{Person.unmetRequirements(person, skill)}</button>"
    else if Person.skillPoints(person) <= 0
      '<button disabled>No skill points</button>'
    else
      "<button onclick='Person.clickSkill(\"#{person}\", \"#{skill}\")'>Select skill</button>"

    """<div class="skill" skill=#{skill}>
      <div class="name">#{data.name or skill}</div>
      #{selectButton}
      <p>#{data.description}</p>
    </div>"""

  clickSkill: (person, skill)->
    g.people[person].skills[skill] = true
    Game.drawOverview()
}

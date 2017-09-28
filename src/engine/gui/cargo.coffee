remainingDiv = (days) ->
  if days >= 0
    """<div><span class="remaining">#{days} days to deliver</span></div>"""
  else
    '''<div><span class="remaining expired">Expired</span></div>'''

$.extend Cargo, {
  drawCargo: ->
    $('header .cargo').html "#{g.cargo.length}/#{Cargo.maxCargo()} Cargo"

    byRemaining = (a, b)-> a.start - b.start

    c = g.cargo.sort(byRemaining).map((c)->
      time = Cargo.deliveryTimeRemaining(c)
      "• #{c.name} from #{Place[c.from].name} to #{Place[c.to].name}, #{if time then time + ' days te deliver' else 'Expired'}"
    )
    $('header .cargo').attr 'title', c.join('\n')

  drawSearch: (place)->
    onclick = if g.map.from is place and g.cargo.length < Cargo.maxCargo()
      'onclick="Cargo.clickSearch(\'' + place + '\');"'
    else ''

    """<td class="cargoSearch #{if onclick then 'active' else ''}" #{onclick}>
      <div>
        <span class="label">Search for jobs</span>
        <span class="cost">
          <span class="#{if g.reputation[place] then '' else 'lowRep'}">#{Math.round(Cargo.searchChance(place) * 100)}%</span>
          <br>#{-Cargo.searchCost(place)} rep
        </span>
        <span class="success">✓</span>
      </div>
    </td>"""

  draw: (cargo)->
    i = g.availableCargo.indexOf(cargo)
    onclick = if g.map.from is cargo.from and Cargo.maxCargo() > g.cargo.length and Cargo.canPickUpDeliver()
      'onclick="Cargo.clickAccept(' + i + ');"'
    else ''

    accept = Cargo.acceptTimeRemaining(cargo)
    """<td class="cargo accept #{i} #{if onclick then 'active' else ''}" #{onclick}>
      <div>
        Load <span class="what">#{cargo.name}</span> for <span class="to">#{Place[cargo.to].name}</span>
        <span class="cost">#{cargo.reputation[0]} rep here<br>#{cargo.reputation[1]} rep there</span>
        <span class="success">✓</span>
      </div>
      <div><span class="remaining">#{accept} days to accept</div>
    </nd>"""

  drawDelivery: (cargo)->
    i = g.cargo.indexOf(cargo)
    onclick = if g.map.from is cargo.to and Cargo.canPickUpDeliver()
      'onclick="Cargo.clickDeliver(' + i + ');"'
    else ''

    result = if Cargo.deliveryTimeRemaining(cargo) >= 0
      "#{cargo.reputation[1]} rep here<br>#{cargo.reputation[0]} rep there"
    else
      ''

    """<td class="cargo delivery #{i} #{if onclick then 'active' else ''}" #{onclick}>
      <div>
        Deliver <span class="what">#{cargo.name}</span> from <span class="from">#{Place[cargo.from].name}</span>
        <span class="cost">#{result}</span>
        <span class="success">✓</span>
      </div>
      #{remainingDiv Cargo.deliveryTimeRemaining(cargo)}
    </td>"""

  clickSearch: (place)->
    Game.passDay()
    chance = Cargo.searchChance(place)
    while chance > Math.random()
      g.availableCargo.push Cargo.create(place)
      chance--

    g.jobSearch[place] = Math.max(0, chance)
    g.reputation[place] -= Cargo.searchCost(place)

    Game.showPassDayOverlay(undefined, 'Repaired the ship')
    Game.animateSuccess('.cargoSearch .success')

  clickAccept: (i)->
    cargo = g.availableCargo[i]
    Cargo.accept(cargo)

    Game.showPassDayOverlay(undefined, "Loaded #{cargo.name.toLowerCase()} destined for #{cargo.to}")
    Game.animateSuccess('.cargo.accept.' + i + ' .success')

  clickDeliver: (i)->
    effects = Cargo.deliver(i)

    Game.showPassDayOverlay(undefined, Game.drawEffects(effects))
    Game.animateSuccess('.cargo.delivery.' + i + ' .success')
}

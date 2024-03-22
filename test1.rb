use_random_seed 20240320
use_bpm 130

# Definition of scales & chords to be used
E_harmonic_major = scale(:E, :harmonic_major)
E_dorian = scale(:E, :dorian)
E_phrygian = scale(:E, :phrygian)
E_lydian = scale(:E, :lydian)
E_mixolydian = scale(:E, :mixolydian)
E_locrian = scale(:E, :locrian)

scale_progr = (ring E_harmonic_major, E_dorian, E_phrygian,E_lydian, E_mixolydian,E_locrian)
chords_progr = (ring (chord :e, 'minor'), (chord :e, 'major'), ( ring :c4, :f4, :a4, :d5 ), ( ring :d4, :g4, :a4, :d5 ) )

# Define the percussion rhythm
rhythm = (ring 1, 0.5, 0.5, 1, 0.5, 0.5)

# Define the live loop for melody
live_loop :melody do
  # Choose a random note from the minor pentatonic scale
  note = E_phrygian.choose
  synth :pretty_bell
  # Play the note with a random duration
  duration = [0.25, 0.5, 2, 4].choose
  with_fx :reverb, mix: 0.5 do
    synth :fm, note: note, sustain: 0.125, release: 0.1
  end

  # Sleep for a random amount of time
  sleep 0.25
end

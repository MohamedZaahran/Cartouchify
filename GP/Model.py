from flask import Flask, request, jsonify
from PIL import Image
import torch
import torchvision.transforms as transforms
from torchvision import models
import torch.nn as nn

app = Flask(__name__)

# Load your pretrained model
model = models.squeezenet1_0(pretrained=True)
num_classes = 253

# Modify the final classifier layer to match the number of classes
model.classifier = nn.Sequential(
    nn.Dropout(p=0.5),
    nn.Conv2d(512, num_classes, kernel_size=1),
    nn.ReLU(inplace=True),
    nn.AdaptiveAvgPool2d((1, 1))
)

# Load the saved state dictionary
file_path = r'F:\ASU\Graduation Project\GP\HieroSecret\GP\Classification_Model.pt'
state_dict = torch.load(file_path, map_location=torch.device('cpu'))  # Use map_location for compatibility
model.load_state_dict(state_dict, strict=False)

# Set the model to evaluation mode
model.eval()

# Define transforms for data preprocessing
transform = transforms.Compose([
    transforms.Resize((224, 224)),
    transforms.ToTensor(),
    transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225]),
])

# Device configuration
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
model.to(device)

@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({'error': 'No file provided'}), 400

    file = request.files['file']
    image = Image.open(file).convert('RGB')

    # Apply transformations
    input_tensor = transform(image).unsqueeze(0).to(device)

    # Get the model's predictions
    with torch.no_grad():
        outputs = model(input_tensor)
        _, predicted = torch.max(outputs, 1)

    # Get the predicted class index
    predicted_class_index = predicted.item()

    # Assuming gardner_list_with_description is defined and loaded here
      # Sample Gardner list with class names and descriptions
    gardner_list_with_description = {
    0: {'code': 'A1', 'description': 'Seated man, Det. of man, names; Pronoun1st sing. i, wi, ink, kwi. “I,” “me,” “my.”'},
    1: {'code': 'A12', 'description': 'Man with bow and quiver, Det. mšʿ “army,” soldier.'},
    2: {'code': 'A16', 'description': 'Man bowing, Det. ksi “bow.”'},
    3: {'code': 'A17', 'description': 'Child with hand to mouth, Det. šri “young.” Ideo. ẖrd “child.”'},
    4: {'code': 'A2', 'description': 'Man with hand to mouth, Det. of eat, drink, speak, think.'},
    5: {'code': 'A21', 'description': 'Man with stick, Det. and Ideo. sr “official, noble.”'},
    6: {'code': 'A24', 'description': 'Man striking with stick in both hands, Det. ḥwi, “strike,” nḥm “take away.” Ideo. nḫt strong.'},
    7: {'code': 'A26', 'description': 'Man beckoning, Det. nis “call.” Ideo. vocative i, “Oh!”'},
    8: {'code': 'A28', 'description': 'Man with arms raised, Det. ḳ3 “high,” ḥʿi “rejoice.”'},
    9: {'code': 'A30', 'description': 'Man with arms outstretched, Det. i3w “praise,” dw3 “adoration.”'},
    10: {'code': 'A4', 'description': 'Man with arms raised, Det. adoration, hide'},
    11: {'code': 'A44', 'description': 'King holding flail and wearing white crown of Upper Egypt'},
    12: {'code': 'A47', 'description': 'Seated sheperd, Det. and Ideo. s3w “guard,” mniw “herdsman.”'},
    13: {'code': 'A51', 'description': 'Noble seated on chair with flagellum, Det. and Ideo. špsi “noble”'},
    14: {'code': 'A52', 'description': 'Kneeling noble with flail, Det. revered person, deceased'},
    15: {'code': 'A55', 'description': 'Mummy on bed, Det. sḏr “lie down,” dead.'},
    16: {'code': 'A6a', 'description': 'Unknown until now'},
    17: {'code': 'A7', 'description': 'Fatigued man, Det. weary, weak'},
    18: {'code': 'Aa1', 'description': 'Placenta Phono. ḫ.'},
    19: {'code': 'Aa21', 'description': 'Phono. wḏʿ. In wḏʿ “judge.”'},
    20: {'code': 'Aa26', 'description': 'Det. in sbi “rebel.”'},
    21: {'code': 'Aa27', 'description': 'Phono. nḏ. In nḏ “ask, inquire.”'},
    22: {'code': 'Aa28', 'description': 'Builder’s tool Phono. qd. In qd “build.”'},
    23: {'code': 'B1', 'description': 'Seated Woman, Det. woman, name. Sometimes for A1 1st sing. pronoun – i'},
    24: {'code': 'C2', 'description': 'God with falcon head and sun-disk holding ʿ, Det. and Ideo. Rʿ “Re, sun-god”'},
    25: {'code': 'C4', 'description': 'God with ram head, Det. or Ideo. ẖnmw “Khnum”'},
    26: {'code': 'D1', 'description': 'Head, Phono. tp. Det. or Ideo. for tp “head,” tpy “first, chief.” Det. ḏ3ḏ3“head.”'},
    27: {'code': 'D156', 'description': 'Unknown until now'},
    28: {'code': 'D19', 'description': 'Eye, nose, and cheek, Det. or Ideo. for fnd “nose.” Det. sn “smell,” rš “rejoice.”'},
    29: {'code': 'D2', 'description': 'Face	Phon. ḥr. Ideo. for ḥr “face.”'},
    30: {'code': 'D21', 'description': 'Mouth, Phon. r. Ideo. for r “mouth.”'},
    31: {'code': 'D28', 'description': 'Two arms, Phono. k3. Ideo. for k3 “soul.”'},
    32: {'code': 'D33', 'description': 'Arms holding oar, Phono. ẖn. Ideo. for ẖni “row.”'},
    33: {'code': 'D34', 'description': 'Arms with shield and axe, Ideo. for ʿḥ3 “fight”'},
    34: {'code': 'D35', 'description': 'Negative arms, Phono. n. Ideo. for n and nn, “not.” Det. negation.'},
    35: {'code': 'D36', 'description': 'Arm	Phono, Ideo. ʿ “arm, hand.”'},
    36: {'code': 'D37', 'description': 'Arm holding Conical Loaf, Phono. di in rdi “give.”'},
    37: {'code': 'D39', 'description': 'Arm holding Bowl, Det. for offer, present. ex. ḥnk “present,” drp “offer.”'},
    38: {'code': 'D4', 'description': '	Eye	Phono. iri “to do, make.” Ideo. for irt “eye.”'},
    39: {'code': 'D40', 'description': 'Arm holding stick	Det. for force, effort. ex. nḫt “strong.” Ideo. h3i “evaluate.”'},
    40: {'code': 'D45', 'description': 'Arm with brush, Det. and Ideo. for ḏsr “clear road, sacred, holy.”'},
    41: {'code': 'D46', 'description': 'Hand, Phono. d. Ideo. for ḏrt “hand.”'},
    42: {'code': 'D52', 'description': 'Penis	Phono. mt. Det. for male. ex. ʿ3 “ass,” ṯ3y “male.” Ideo. k3 “bull.”'},
    43: {'code': 'D53', 'description': 'Penis with liquid	Det. for male, penis. ex. m b3ḥ “in the presence of” ḏr b3ḥ “since,” r b3ḥ “before.”'},
    44: {'code': 'D54', 'description': 'Legs walking, Phono. iw in iwi “come.” Det. for motion.'},
    45: {'code': 'D56', 'description': 'Leg	Phono. pd. Det. for leg, foot. ex. rd “leg,” pd “knee.”'},
    46: {'code': 'D58', 'description': 'Foot, Phono. b. Ideo. for bw “place.”'},
    47: {'code': 'D6', 'description': 'Eye with paint, Det. for actions or conditions of the eye. ex. dgi “look,” šp “blind.”'},
    48: {'code': 'D60', 'description': 'Foot with water streaming, Ideo. for wʿb “pure, clean.”'},
    49: {'code': 'D62', 'description': 'Toes, Ideo. for s3ḥ “toe”'},
    50: {'code': 'E1', 'description': 'Bull	Det. of cattle, ex. ng “bull,” mnmnt “cattle.” Ideo. in k3 “bull.”'},
    51: {'code': 'E13', 'description': 'Cat	Det. in miw “cat.”'},
    52: {'code': 'E14', 'description': 'Dog	Det. in iw “dog,” ṯsm “hound.”'},
    53: {'code': 'E15', 'description': 'Recumbent Jackal, Det. or Ideo. in Inpw, “Anubis.”'},
    54: {'code': 'E16', 'description': 'Recumbent Jackal on shrine, Det. or Ideo. in Inpw, “Anubis.”'},
    55: {'code': 'E17', 'description': 'Jackal	Det. or Ideo. in s3b “jackal” and “dignitary.”'},
    56: {'code': 'E23', 'description': 'Recumbent Lion	Phon. rw, Det. or Ideo. in rw “lion.”'},
    57: {'code': 'E34', 'description': 'Hare, Phono. wn. wnn “be.”'},
    58: {'code': 'E7', 'description': 'Donkey, Det. in ʿ3 “donkey.”'},
    59: {'code': 'E9', 'description': 'Newborn bubalis, Phon. iw. In iwr “conceive.”'},
    60: {'code': 'F1', 'description': 'Head of ox, Ideo. in offering formulas for k3 “cattle.”'},
    61: {'code': 'F12', 'description': 'Head and neck of jackal, Phon. wsr. Ideo in wsrt “neck.” In wsr “powerful”'},
    62: {'code': 'F13', 'description': 'Horns of ox	Phon. wp. Ideo. in wpt “brow, beginning.”'},
    63: {'code': 'F16', 'description': 'Horn, Phono. ʿb. Det. or Ideo. in db “horn,” ʿb “horn.” In m-ʿb “together with.”'},
    64: {'code': 'F18', 'description': 'Tusk of elephant, Phono. bḥ, ḥw. Det. and Ideo. in ibḥ “tooth.” Det. in sbḥ “cry.”'},
    65: {'code': 'F21', 'description': 'Ear of ox, Phono. sḏm, idn. Det. or Ideo. in msḏr “ear. Ideo. sḏm, “hear.”'},
    66: {'code': 'F22', 'description': 'Hindquarters of leopard or lion, Phono. pḥ in “reach,” pḥty “strength.” Ideo. for pḥwy “end.”'},
    67: {'code': 'F23', 'description': 'Foreleg of ox, Det. or Ideo. in ḫpš “strong arm, leg.”'},
    68: {'code': 'F24', 'description': 'Backleg of ox, Det. or Ideo. in ḫpš “strong arm, leg.”'},
    69: {'code': 'F25', 'description': 'Leg and hoof of ox	Phono. wḥm in “hoof,” “repeat.”'},
    70: {'code': 'F26', 'description': 'Goatskin, Phono. ẖn. In ẖnw “interior,” ẖn “approach.”'},
    71: {'code': 'F29', 'description': 'Phono. st. Det. and Ideo. sti “pierce, shoot.”'},
    72: {'code': 'F31', 'description': 'Three fox skins, Phono. ms. In msi “give birth.”'},
    73: {'code': 'F34', 'description': 'Heart	Ideo. in ib “heart.” Det. of ” ḥ3ty “heart.”'},
    74: {'code': 'F35', 'description': 'Heart and windpipe, Phono. nfr. In nfr “good, beautiful.”'},
    75: {'code': 'F4', 'description': 'Forepart of lion, Ideo. in ḥ3t “front,” ḥ3ty “heart.”'},
    76: {'code': 'F40', 'description': 'Backbone and spinal cord at each end, Phono. 3w.'},
    77: {'code': 'F44', 'description': 'Leg bone with meat,	Phono. iwʿ, isw. In iwʿ inherit,” siw “exchange.”'},
    78: {'code': 'F51', 'description': 'Piece of flesh, Phono. is, ist, ws. Det. ḥʿ “flesh,” iwf “meat.”'},
    79: {'code': 'F63', 'description': 'Unknown until now'},
    80: {'code': 'F9', 'description': 'Head of leopard, Det. or Ideo. in pḥty “strength.”'},
    81: {'code': 'G1', 'description': 'Vulture, Phono. 3. In 3 “vulture.’'},
    82: {'code': 'G10', 'description': 'Falcon in sacred bark, Det. in skr “Sokar,” ḥnw “Sokar bark.”'},
    83: {'code': 'G14', 'description': 'Vulture, Phono. mwt, mt. In mwt “mother.”'},
    84: {'code': 'G17', 'description': 'Owl	Phono. m.'},
    85: {'code': 'G20', 'description': 'Phono. mi, m.'},
    86: {'code': 'G21', 'description': 'Guinea fowl, Phono. nḥ. In nḥḥ “eternity.”'},
    87: {'code': 'G25', 'description': 'Crested Ibis, Phono. 3ḫ. In “spirit.”'},
    88: {'code': 'G26', 'description': 'Sacred ibis on standard	Det. in ḏḥwty “Thoth.”'},
    89: {'code': 'G29', 'description': 'Jabiru, Phono. b3. In “soul.”'},
    90: {'code': 'G30', 'description': 'Three jabirus	Ideo. in b3w “spirits, strength.”'},
    91: {'code': 'G33', 'description': 'Egret, Det. sd3 “tremble.”'},
    92: {'code': 'G35', 'description': 'Cormorant, Phono. ʿq. In ʿq “enter.”'},
    93: {'code': 'G36', 'description': 'Phono. wr. In wr “great.”'},
    94: {'code': 'G37', 'description': 'Sparrow, Det. in nḏs “small,” bin “bad.”'},
    95: {'code': 'G39', 'description': 'Duck, Phono. s3. In s3 “son.” Det. in si “duck.”'},
    96: {'code': 'G4', 'description': 'Buzzard, Phono. tyw.'},
    97: {'code': 'G40', 'description': 'Duck flying, Phono. p3. In p3 “the,” “fly.”'},
    98: {'code': 'G43', 'description': 'Quail chick, Phono. w.'},
    99: {'code': 'G5', 'description': 'Falcon, Ideo. ḥrw “Horus.”'},
    100: {'code': 'G50', 'description': 'Two plovers, Ideo. for rḫty “washerman.”'},
    101: {'code': 'G54', 'description': 'Plucked bird, Phono. snḏ. In snḏ “fear.”'},
    102: {'code': 'G7', 'description': 'Falcon on standard, Det. imn “Amun,” nsw “king,” divine. 1st sing. pro. i, wi, with divine speaker.'},
    103: {'code': 'H1', 'description': 'Head of duck, Ideo. in 3pd “bird.” Det. in wšn “wring the neck of birds.”'},
    104: {'code': 'H2', 'description': 'Head of crested bird, Phono. m3ʿ, wšm, p3q. Det. in m3ʿ “temple of the head'},
    105: {'code': 'H5', 'description': 'Wing, Det. in ḏnḥ “wing.”'},
    106: {'code': 'H6', 'description': 'Feather	, Phono. šw. Ideo. in šwt “feather.” Det. and Ideo. in m3ʿt “truth.”'},
    107: {'code': 'I10', 'description': 'Cobra,	Phono. ḏ.'},
    108: {'code': 'I5', 'description': 'Crocodile, with curved tail	Det. in s3q “collect, gather.”'},
    109: {'code': 'I9', 'description': 'Horned viper, Phono. f. Det. in it “father.”'},
    110: {'code': 'L1', 'description': 'Scarab beetle,Phono. ḫpr. In ḫpr “being, exist, become'},
    111: {'code': 'L2', 'description': 'Bee, Ideo. for bity “King of Lower Egypt.”'},
    112: {'code': 'M1', 'description': 'Tree, Phono. im3. Det. nhwt, mnw “trees.”'},
    113: {'code': 'M12', 'description': 'Lily plant, Phono. ḫ3. In ḫ3w nw sšn “lily plants” ḫ3 “1,000,” sḫ3 “remember.”'},
    114: {'code': 'M16', 'description': 'Papyrus clump,	Phono. ḥ3 . In ḥ3q “capture.” Det. in “The Delta.”'},
    115: {'code': 'M17', 'description': 'Reed leaf,	Phono. i. Phono. y, when doubled.'},
    116: {'code': 'M17a', 'description': 'Unknown'},
    117: {'code': 'M18', 'description': 'Combination of M17 + D54,	Phono i. In ii “come.”'},
    118: {'code': 'M19', 'description': 'Conical cakes between signs M17 and U36, Det. and Ideo. in ʿ3bt “offering.”'},
    119: {'code': 'M195', 'description': 'Unknown'},
    120: {'code': 'M2', 'description': 'Plant, Phono. ḥn. In ḥni “rush,” ḥnw “vessel.” Det. in is “tomb.”'},
    121: {'code': 'M20', 'description': 'Reed field,Det. sḫt “marshland,” sm “occupation.”'},
    122: {'code': 'M22', 'description': 'Rush with shoots,	Phono. nḫb . Phono. nn, when doubled. In nḫbt “germination,” “Nehkbet.”'},
    123: {'code': 'M23', 'description': 'Sedge,	Phono. sw. Ideo. nswt “king.”'},
    124: {'code': 'M26', 'description': 'Sedge,	Phono. šmʿ. Ideo. šmʿw in “Upper Egypt.”'},
    125: {'code': 'M29', 'description': 'Pod,Phono. nḏm. In nḏm “sweet.'},
    126: {'code': 'M3', 'description': 'Branch,	Phono. ḫt. In ḫt “wood,” ḫtyw “terrace,” nḫt “strong.”'},
    127: {'code': 'M35', 'description': 'Grain, heap Det. in ʿḥʿw “heaps.”'},
    128: {'code': 'M36', 'description': 'Flax bundle, Phono. ḏr. In ḏr “since,” nḏri “hold fast.”'},
    129: {'code': 'M4', 'description': 'Stripped palm branch, Ideo. in rnpt “year,” ḥsbt “regnal year.” Det. in tr “time.”'},
    130: {'code': 'M40', 'description': 'Reed bundle, Phono is. In is “tomb,” iswt “crew.”'},
    131: {'code': 'M41', 'description': 'Wood log,Det. in ʿš “cedar.”r'},
    132: {'code': 'M42', 'description': 'Flower, Phono. wn. In wnm “eat,” ḥwn “be young.”r'},
    133: {'code': 'M44', 'description': 'Thorn,	Det. spd “sharp.”'},
    134: {'code': 'M7', 'description': 'Combination of M4 + Q3, Det. or Ideo. in rnpi “young.”'},
    135: {'code': 'M8', 'description': 'Pool with lilies, Phono š3. In š3 “marsh.” Ideo. 3ḫt “Inundation” (season).'},
    136: {'code': 'N1', 'description': 'Sky, Det. or Ideo. pt “sky,” ḥrt “heaven,” ḥry “above.”'},
    137: {'code': 'N14', 'description': 'Star, Phono. sb3, dw3. In sb3 “star,” dw3 “morning.” Ideo. wnwt “hour.”'},
    138: {'code': 'N16', 'description': 'Flat land with grain, Phono. t3. In t3 “land, earth.”Det. in ḏt “eternity.”'},
    139: {'code': 'N17', 'description': 'Var. of N16, 	Use as N16.r'},
    140: {'code': 'N18', 'description': 'Strip of sand, Ideo. in iw “island.”'},
    141: {'code': 'N19', 'description': 'Two strips of sand, Ideo. in 3ḫt “horizon,” ḥrw-3ḫty “Horakhty.”r'},
    142: {'code': 'N2', 'description': 'Sky with broken S40, Det. or Ideo. grḥ “night.”'},
    143: {'code': 'N21', 'description': 'Tongue of land, Ideo. in idb “bank,” idbwy “two banks.”'},
    144: {'code': 'N24', 'description': 'Irrigation canal system, Det. or Ideo. in sp3t “nome.”'},
    145: {'code': 'N25', 'description': 'Mountain rande, Ideo. in ḫ3st “foreign land, hill country.”r'},
    146: {'code': 'N26', 'description': 'Mountain, Phono. ḏw “mountain.”'},
    147: {'code': 'N27', 'description': 'Sunrise over mountain	Ideo. in 3ḫt “horizon.”'},
    148: {'code': 'N28', 'description': 'Hill with sun rays, Phono. ḫʿ. In ḫʿ “appear.”'},
    149: {'code': 'N29', 'description': 'Sandy slope, Phono. q.'},
    150: {'code': 'N30', 'description': 'Hill with shrubs, Det. or Ideo. in i3t “mound.”'},
    151: {'code': 'N31', 'description': 'Road bordered by shrubs, Det. and Ideo. in w3t “road.”'},
    152: {'code': 'N33a', 'description': 'unknown'},
    153: {'code': 'N35', 'description': 'Water ripple, Phono. n.'},
    154: {'code': 'N36', 'description': 'Canal, Phono. mr. In mr “canal.”'},
    155: {'code': 'N37', 'description': 'Pool, Phono. š. In š “pool.”r'},
    156: {'code': 'N40', 'description': 'Combination of N37 and D54, Phono, šm. In šm “to go.”'},
    157: {'code': 'N41', 'description': 'Well with water, Phono. ḥm. In ḥmt “wife.” Det. in bi3 “copper.”'},
    158: {'code': 'N42', 'description': 'Var. of N41, Use as N41.'},
    159: {'code': 'N5', 'description': 'Sun, Ideo. rʿ “sun, Re” hrw “day,” sw “day.”'},
    160: {'code': 'N8', 'description': 'Sun with rays, Phono. wbn. Det. or Ideo. 3ḫw “sunshine,” psḏ “shine,” wbn “rise.”'},
    161: {'code': 'O1', 'description': 'House plan,Phono. pr. In pr “house,” pri “go.”'},
    162: {'code': 'O11', 'description': 'unknown'},
    163: {'code': 'O28', 'description': 'Column with tenon, Phono iwn. In iwnw “Heliopolis,” iwn “column.”'},
    164: {'code': 'O29A', 'description': 'unknown'},
    165: {'code': 'O3', 'description': 'Combination of O1 + P8 + X3 + W22, Ideo. in prt-ḫrw “invocation offering.”'},
    166: {'code': 'O31', 'description': 'Door, Det. in ʿ3 “door,” sn, wn “open.”'},
    167: {'code': 'O34', 'description': 'Door bolt, Phono. s. In s “bolt.”'},
    168: {'code': 'O38', 'description': 'Corner of wall, Ideo. in qnbt “court, corner, magistrates.”'},
    169: {'code': 'O4', 'description': 'Reed shelter, Phono. h.'},
    170: {'code': 'O43', 'description': 'Var. of O42, Use as O42'},
    171: {'code': 'O49', 'description': 'Area with crossroads, Ideo. in niwt “town.”'},
    172: {'code': 'O50', 'description': 'Threshing floor with grain, Phono. sp. In sp “occasion, time, event,” sp sn “two times.”'},
    173: {'code': 'O51', 'description': 'Grain mound on mud floor, Det. or Ideo. in šnwt “granary.”'},
    174: {'code': 'P1', 'description': 'Boat on water, Det. of boats. In dpt “ship,” ḥʿw “ships,” ḫdi “sail downstream.”'},
    175: {'code': 'P13', 'description': 'unknown'},
    176: {'code': 'P3', 'description': 'Sacred bark, Det. wi3 “sacred bark,” ḏ3i “cross”'},
    177: {'code': 'P6', 'description': 'Mast, Phono. ʿḥʿ. In ʿḥʿ “stand.”'},
    178: {'code': 'P8', 'description': 'Oar,Phono ḫrw. In m3ʿ ḫrw “justified” ḫrw “voice,” ḫrwy “enemy.”'},
    179: {'code': 'P98', 'description': 'Unknown until now'},
    180: {'code': 'Q1', 'description': 'Seat, Phono. st, ws. In st “seat, place,” wsir “Osiris,” ḥtm “perish.”'},
    181: {'code': 'Q3', 'description': 'Stool, Phono. p.'},
    182: {'code': 'Q6', 'description': 'Coffin, Det. or Ideo. in qrs “bury,” qrsw “coffin.”'},
    183: {'code': 'Q7', 'description': 'Brazier with flame, Det. of fire. In ḫt “fire,” sḏt “flame,” srf “temperature.”'},
    184: {'code': 'R13', 'description': 'Ideo. in imnt “West,” wnmi “right.”'},
    185: {'code': 'R25', 'description': 'Neith emblem	Det. in nit “Neith.”'},
    186: {'code': 'R4', 'description': 'Bread loaf on mat	Phono. ḥtp. In ḥtp “altar, rest, be pleased.”'},
    187: {'code': 'R8', 'description': 'Flag, Phono. nṯr. In nṯr “god.”'},
    188: {'code': 'R8a', 'description': 'Unknown until now'},
    189: {'code': 'S19', 'description': 'Necklace and cylinder seal	Ideo. in sḏ3wty “treasurer,” sḏ3w “precious.” Det. or Ideo. in ḫtm “seal.”'},
    190: {'code': 'S24', 'description': 'Knotted belt, Phono. ṯs. In ṯs “tie, bind.”'},
    191: {'code': 'S28', 'description': 'Det. in ḥbs “clothing,” ḥ3p “conceal,” kfi “uncover.”'},
    192: {'code': 'S29', 'description': 'Phono. spḫr, “write, copy.”'},
    193: {'code': 'S3', 'description': 'Red crown of Lower Egypt, Phono. n. Det. or Ideo in dšrt “Red Crown.”'},
    194: {'code': 'S34', 'description': 'Sandal strap, Phono. ʿnḫ. In ʿnḫ “live,” ʿnḫ “sandal strap.”'},
    195: {'code': 'S38', 'description': 'Crook, Phono. ḥq3. In ḥq3 “rule,” ḥq3t “scepter.”'},
    196: {'code': 'S43', 'description': 'Staff,	Phono. md. In mdw “speak.”'},
    197: {'code': 'T12', 'description': 'Bowstring, Phono. rwd/rwḏ. In rwd “hard, firm.” Ideo. in d3r “subdue.”'},
    198: {'code': 'T14', 'description': 'Throw stick, Det. of “foreign.” Ideo. in ʿ3m “Asiatics,” ṯḥnw “Libya.” Det. in qm3 “create,” qm3i “create.”'},
    199: {'code': 'T20', 'description': 'Bone harpoon head, Phono. qs. In qs “annoy,” qrs “bury.” Det. in twr “pure.”'},
    200: {'code': 'T21', 'description': 'Harpoon, Phono. in wʿ. In wʿ “one.”'},
    201: {'code': 'T22', 'description': 'Arrowhead,	Phono. sn. In sn “brother,” sn “smell.”'},
    202: {'code': 'T28', 'description': 'Butcher’s block, Phono. ẖr. In ẖr “under,” ẖrt “portion.”'},
    203: {'code': 'T30', 'description': 'Knife, Ideo. for dmt “knife.” Det. in dm “be sharp.”'},
    204: {'code': 'U1', 'description': 'Sickle, Phono. m3. In m33 “see,” 3sḫ “reap.”'},
    205: {'code': 'U15', 'description': 'Sled, Phono. tm. In tm “be complete,” ḥtm “perish.”'},
    206: {'code': 'U28', 'description': 'Fire drill, Phono. ḏ3. In ʿnḫ.(w) (w)ḏ3 snb “may he live, be prosperous, be healthy.” (L.P.H.)'},
    207: {'code': 'U33', 'description': 'Pestle, Phono. ti.'},
    208: {'code': 'U35', 'description': 'Combination of U34 + I9, Phono. ḫsf.'},
    209: {'code': 'U36', 'description': 'Club used in washing, Phono. ḥm. In ḥm “slave,” ḥm “Majesty.”'},
    210: {'code': 'U6', 'description': 'Hoe,  Phono. mr. In mri “love.”'},
    211: {'code': 'U7', 'description': 'Var. of U6, Use as U6'},
    212: {'code': 'V1', 'description': 'Rope coil, Phono. šn. In šnt “dispute,” šni “litigate,” št “hundred.”'},
    213: {'code': 'V13', 'description': 'Tethering rope, Phono. ṯ.'},
    214: {'code': 'V16', 'description': 'Hobble for cattle, Phono. s3. In s3 “protection.”'},
    215: {'code': 'V20', 'description': 'Hobble for cattle sans crossbar, Phono. mḏ. In mḏwt “stables,” mḏ “10.”'},
    216: {'code': 'V24', 'description': 'Cord on Stick, Phono. wḏ. In wḏ “command, decree.”'},
    217: {'code': 'V25', 'description': 'Var. of V24, Use as V24'},
    218: {'code': 'V28', 'description': 'Wick, Phono. ḥ.'},
    219: {'code': 'V30', 'description': 'Basket, Phono. nb. In nb “lord,” nb “every, all.”'},
    220: {'code': 'V31', 'description': 'Basket with handle, Phono k.'},
    221: {'code': 'V4', 'description': 'Lasso, Phono. w3. In w3ḥ “endure.”'},
    222: {'code': 'V6', 'description': 'Cord with loop facing downwards, Phono. šs, šsr.'},
    223: {'code': 'V7', 'description': 'Cord with loop facing upwards, Phono. šn.'},
    224: {'code': 'W10', 'description': 'Cup, Phono. ḥnw. In ḥnwt “mistress.” Det. or Ideo. in wsḫ “wide.”'},
    225: {'code': 'W11', 'description': 'Ring stand, Phono. g. Det. or Ideo. in nst “throne.”'}, 
    226: {'code': 'W14', 'description': 'Tall jar, Phono. ḥs. In ḥst “water jar.”'},
    227: {'code': 'W15', 'description': 'Tall jar with water, Det. or Ideo. in qbb, qbḥ “cool, water.”'},
    228: {'code': 'W18', 'description': 'Tall jars in rack,	Phono. ḫnt. In ḫntw “jar rack.”'},
    229: {'code': 'W19', 'description': 'Milk jug, Phono. mi. In mi “likeness.”'},
    230: {'code': 'W2', 'description': 'Oil jar without ties, Phono. b3s. In b3stt “Bastet,” b3s “oil jar.”'},
    231: {'code': 'W22', 'description': 'Beer jugs, Ideo. in ḥnqt “beer.” Det. in qrḥt “vessel.”'},
    232: {'code': 'W24', 'description': 'Bowl, Phono. nw, in, ink.'},
    233: {'code': 'W24a', 'description': 'Unknown until now'},
    234: {'code': 'W25', 'description': 'Phono. in. In ini “fetch, bring.”'},
    235: {'code': 'W3', 'description': 'Alabaster basin, Det. or Ideo. in ḥb “feast,” ḥb “mourn.”'},
    236: {'code': 'W4', 'description': 'Det. or Ideo. in ḥb “feast,” tp-rnpt “feat of the first of the year.”'},
    237: {'code': 'W9', 'description': 'Stone jug	Phono. ẖnm.'},
    238: {'code': 'X1', 'description': 'Small bread loaf, Phono. t. Ideo. in t “bread.”'},
    239: {'code': 'X3a', 'description': 'Unknown until now'},
    240: {'code': 'X6', 'description': 'Round loaf with baker’s mark, Det. in p3t “loaf.”'},
    241: {'code': 'X8', 'description': 'Conical Loaf, Phono. di. In rdi “give.”'},
    242: {'code': 'Y1', 'description': 'Papyrus scroll, Phono. mḏ3t. Ideo. in mḏ3t “paypyrus roll, book.” Det. in rḫ “know.”'},
    243: {'code': 'Y2', 'description': 'Papyrus scroll, Phono. mḏ3t. Ideo. in mḏ3t “paypyrus roll, book.” Det. in rḫ “know.”'},
    244: {'code': 'Y3', 'description': 'Scribal kit, Det. or Ideo. in sš “write,” nʿʿ “smooth.”'},
    245: {'code': 'Y5', 'description': 'Game board, Phono. mn. In imn “Amun” mn “remain.”'},
    246: {'code': 'Z1', 'description': 'Stroke Follows Ideograms, Det. wʿ “one.” Ideo. numerals 1-9.'},
    247: {'code': 'Z11', 'description': 'Crossed planks, Phono. im. In imy “who is in.”'},
    248: {'code': 'Z2', 'description': 'Triple stroke, Det. of plurality.'},
    249: {'code': 'Z3', 'description': 'Det. of plurality, Three vertical strokes'},
    250: {'code': 'Z4', 'description': 'Two diagonal strokes, Det. Duality'},
    251: {'code': 'Z7', 'description': 'Quail chick, Phono. w.'},
    252: {'code': 'Z9', 'description': 'Crossed sticks	Phono. sw3. In sw3 “pass.”'}
}
    description = gardner_list_with_description[predicted_class_index]

    return jsonify({'predicted_class_index': predicted_class_index, 'description': description})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
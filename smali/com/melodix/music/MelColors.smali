.class public final Lcom/melodix/music/MelColors;
.super Ljava/lang/Object;

# Runtime palette - THE entry point for the future in-app theme settings.
# Every color the code paints is read from these static fields; res/values/
# colors.xml (mel_*) holds the same defaults for XML layouts and drawables,
# and tests/smali_sanity.test.js pins both sides to identical values.
# The theme screen will simply assign these fields and re-render.

.field public static accent:I
.field public static accentDeep:I
.field public static background:I
.field public static surface:I
.field public static surfaceHigh:I
.field public static surfaceBtn:I
.field public static textPrimary:I
.field public static textSecondary:I
.field public static textTertiary:I
.field public static stroke:I
.field public static strokeAccent:I
.field public static glow:I

.method static constructor <clinit>()V
    .locals 1

    const v0, 0xff1ed760

    sput v0, Lcom/melodix/music/MelColors;->accent:I

    const v0, 0xff0e8f47

    sput v0, Lcom/melodix/music/MelColors;->accentDeep:I

    const v0, 0xff060809

    sput v0, Lcom/melodix/music/MelColors;->background:I

    const v0, 0xff10151a

    sput v0, Lcom/melodix/music/MelColors;->surface:I

    const v0, 0xff1a222a

    sput v0, Lcom/melodix/music/MelColors;->surfaceHigh:I

    const v0, 0xff232d36

    sput v0, Lcom/melodix/music/MelColors;->surfaceBtn:I

    const v0, 0xffffffff

    sput v0, Lcom/melodix/music/MelColors;->textPrimary:I

    const v0, 0xffbfc0cb

    sput v0, Lcom/melodix/music/MelColors;->textSecondary:I

    const v0, 0xff8e96a3

    sput v0, Lcom/melodix/music/MelColors;->textTertiary:I

    const v0, 0x2effffff

    sput v0, Lcom/melodix/music/MelColors;->stroke:I

    const v0, 0x2e1ed760

    sput v0, Lcom/melodix/music/MelColors;->strokeAccent:I

    const v0, 0x331ed760

    sput v0, Lcom/melodix/music/MelColors;->glow:I

    return-void
.end method

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
.field public static navInactive:I
.field public static warning:I
.field public static stroke:I
.field public static strokeAccent:I
.field public static glow:I
.field public static glassFill:I
.field public static glassStroke:I
.field public static glassTabbar:I
.field public static glassCard:I

.method static constructor <clinit>()V
    .locals 1

    const v0, 0xffa78bfa

    sput v0, Lcom/melodix/music/MelColors;->accent:I

    const v0, 0xff7c3aed

    sput v0, Lcom/melodix/music/MelColors;->accentDeep:I

    const v0, 0xff0b0b14

    sput v0, Lcom/melodix/music/MelColors;->background:I

    const v0, 0xcc141222

    sput v0, Lcom/melodix/music/MelColors;->surface:I

    const v0, 0xe01a222a

    sput v0, Lcom/melodix/music/MelColors;->surfaceHigh:I

    const v0, 0xd9232d36

    sput v0, Lcom/melodix/music/MelColors;->surfaceBtn:I

    const v0, 0xffffffff

    sput v0, Lcom/melodix/music/MelColors;->textPrimary:I

    const v0, 0xffbfc0cb

    sput v0, Lcom/melodix/music/MelColors;->textSecondary:I

    const v0, 0xffa1a1b5

    sput v0, Lcom/melodix/music/MelColors;->textTertiary:I

    const v0, 0xffe6e6f2

    sput v0, Lcom/melodix/music/MelColors;->navInactive:I

    const v0, 0xffff6b6b

    sput v0, Lcom/melodix/music/MelColors;->warning:I

    const v0, 0x24ffffff

    sput v0, Lcom/melodix/music/MelColors;->stroke:I

    const v0, 0x2ea78bfa

    sput v0, Lcom/melodix/music/MelColors;->strokeAccent:I

    const v0, 0x337c3aed

    sput v0, Lcom/melodix/music/MelColors;->glow:I

    const v0, 0x12ffffff

    sput v0, Lcom/melodix/music/MelColors;->glassFill:I

    const v0, 0x24ffffff

    sput v0, Lcom/melodix/music/MelColors;->glassStroke:I

    const v0, 0x12ffffff

    sput v0, Lcom/melodix/music/MelColors;->glassTabbar:I

    const v0, 0x12ffffff

    sput v0, Lcom/melodix/music/MelColors;->glassCard:I

    return-void
.end method

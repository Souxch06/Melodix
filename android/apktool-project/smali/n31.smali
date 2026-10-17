.class public final Ln31;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public final synthetic j:Landroidx/preference/SeekBarPreference;


# direct methods
.method public constructor <init>(Landroidx/preference/SeekBarPreference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ln31;->j:Landroidx/preference/SeekBarPreference;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object p0, p0, Ln31;->j:Landroidx/preference/SeekBarPreference;

    .line 9
    .line 10
    iget-boolean p1, p0, Landroidx/preference/SeekBarPreference;->c0:Z

    .line 11
    .line 12
    if-nez p1, :cond_1

    .line 13
    .line 14
    const/16 p1, 0x15

    .line 15
    .line 16
    if-eq p2, p1, :cond_4

    .line 17
    .line 18
    const/16 p1, 0x16

    .line 19
    .line 20
    if-ne p2, p1, :cond_1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/16 p1, 0x17

    .line 24
    .line 25
    if-eq p2, p1, :cond_4

    .line 26
    .line 27
    const/16 p1, 0x42

    .line 28
    .line 29
    if-ne p2, p1, :cond_2

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_2
    iget-object p0, p0, Landroidx/preference/SeekBarPreference;->a0:Landroid/widget/SeekBar;

    .line 33
    .line 34
    if-nez p0, :cond_3

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_3
    invoke-virtual {p0, p2, p3}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0

    .line 42
    :cond_4
    :goto_0
    const/4 p0, 0x0

    .line 43
    return p0
.end method

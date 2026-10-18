.class public final synthetic Lg61;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field public final synthetic j:Landroid/content/Context;

.field public final synthetic k:Le2;

.field public final synthetic l:Landroid/widget/EditText;

.field public final synthetic m:Lhz0;

.field public final synthetic n:Lcom/melodix/music/SettingsActivity$a;

.field public final synthetic o:Landroidx/preference/Preference;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Le2;Landroid/widget/EditText;Lhz0;Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lg61;->j:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lg61;->k:Le2;

    .line 7
    .line 8
    iput-object p3, p0, Lg61;->l:Landroid/widget/EditText;

    .line 9
    .line 10
    iput-object p4, p0, Lg61;->m:Lhz0;

    .line 11
    .line 12
    iput-object p5, p0, Lg61;->n:Lcom/melodix/music/SettingsActivity$a;

    .line 13
    .line 14
    iput-object p6, p0, Lg61;->o:Landroidx/preference/Preference;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/content/DialogInterface;I)V
    .locals 4

    .line 1
    iget-object p1, p0, Lg61;->k:Le2;

    .line 2
    .line 3
    iget-object p1, p1, Le2;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p2, p0, Lg61;->l:Landroid/widget/EditText;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lg61;->j:Landroid/content/Context;

    .line 19
    .line 20
    invoke-static {v0}, Lbh;->s(Landroid/content/Context;)Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    move-object v3, v2

    .line 39
    check-cast v3, Le2;

    .line 40
    .line 41
    iget-object v3, v3, Le2;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 v2, 0x0

    .line 51
    :goto_0
    check-cast v2, Le2;

    .line 52
    .line 53
    if-nez v2, :cond_2

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    invoke-static {p2}, Lda1;->Q(Ljava/lang/String;)Ljava/lang/CharSequence;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    .line 66
    .line 67
    iput-object p1, v2, Le2;->b:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0, v2}, Lbh;->B(Landroid/content/Context;Le2;)V

    .line 70
    .line 71
    .line 72
    :goto_1
    iget-object p1, p0, Lg61;->n:Lcom/melodix/music/SettingsActivity$a;

    .line 73
    .line 74
    iget-object p2, p0, Lg61;->o:Landroidx/preference/Preference;

    .line 75
    .line 76
    invoke-static {p1, p2}, Lcom/melodix/music/SettingsActivity$a;->R(Lcom/melodix/music/SettingsActivity$a;Landroidx/preference/Preference;)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lg61;->m:Lhz0;

    .line 80
    .line 81
    iget-object p0, p0, Lhz0;->j:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast p0, Lg4;

    .line 84
    .line 85
    if-eqz p0, :cond_3

    .line 86
    .line 87
    invoke-virtual {p0}, Lg4;->dismiss()V

    .line 88
    .line 89
    .line 90
    :cond_3
    return-void
.end method

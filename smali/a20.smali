.class public final synthetic La20;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/ExpandablePreferenceCategory;


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/ExpandablePreferenceCategory;I)V
    .locals 0

    .line 1
    iput p2, p0, La20;->j:I

    .line 2
    .line 3
    iput-object p1, p0, La20;->k:Lcom/melodix/music/ExpandablePreferenceCategory;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget p1, p0, La20;->j:I

    .line 2
    .line 3
    iget-object p0, p0, La20;->k:Lcom/melodix/music/ExpandablePreferenceCategory;

    .line 4
    .line 5
    packed-switch p1, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 9
    .line 10
    xor-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/melodix/music/ExpandablePreferenceCategory;->B(Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    iget-boolean p1, p0, Lcom/melodix/music/ExpandablePreferenceCategory;->d0:Z

    .line 17
    .line 18
    xor-int/lit8 p1, p1, 0x1

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/melodix/music/ExpandablePreferenceCategory;->B(Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    nop

    .line 25
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

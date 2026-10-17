.class public final synthetic Lzk0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic j:I

.field public final synthetic k:Lcom/melodix/music/MainActivity;

.field public final synthetic l:Z


# direct methods
.method public synthetic constructor <init>(Lcom/melodix/music/MainActivity;ZI)V
    .locals 0

    .line 1
    iput p3, p0, Lzk0;->j:I

    .line 2
    .line 3
    iput-object p1, p0, Lzk0;->k:Lcom/melodix/music/MainActivity;

    .line 4
    .line 5
    iput-boolean p2, p0, Lzk0;->l:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 9

    .line 1
    iget v0, p0, Lzk0;->j:I

    .line 2
    .line 3
    const-wide/16 v1, 0x1f4

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    iget-boolean v4, p0, Lzk0;->l:Z

    .line 7
    .line 8
    iget-object p0, p0, Lzk0;->k:Lcom/melodix/music/MainActivity;

    .line 9
    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_1

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    new-instance v1, Lr20;

    .line 49
    .line 50
    invoke-direct {v1, p0, v4}, Lr20;-><init>(Lcom/melodix/music/MainActivity;Z)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    if-eqz p0, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-void

    .line 63
    :pswitch_0
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 64
    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    if-eqz v0, :cond_2

    .line 72
    .line 73
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 77
    .line 78
    const/4 v5, 0x0

    .line 79
    if-eqz v0, :cond_3

    .line 80
    .line 81
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 82
    .line 83
    .line 84
    :cond_3
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->H:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 85
    .line 86
    const/high16 v6, 0x3f800000    # 1.0f

    .line 87
    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    invoke-virtual {v0, v6}, Landroid/view/View;->setAlpha(F)V

    .line 91
    .line 92
    .line 93
    :cond_4
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->N:Landroid/widget/FrameLayout;

    .line 94
    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    const/4 v7, 0x4

    .line 98
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 99
    .line 100
    .line 101
    :cond_5
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->K:Landroid/widget/TextView;

    .line 102
    .line 103
    if-eqz v0, :cond_7

    .line 104
    .line 105
    if-eqz v4, :cond_6

    .line 106
    .line 107
    const-string v4, "Network Error\nTap to retry"

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_6
    const-string v4, "Service Disabled\nTap to start"

    .line 111
    .line 112
    :goto_0
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 113
    .line 114
    .line 115
    :cond_7
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->I:Landroid/widget/ImageView;

    .line 116
    .line 117
    if-eqz v0, :cond_8

    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    if-eqz v0, :cond_8

    .line 124
    .line 125
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 126
    .line 127
    .line 128
    :cond_8
    iget-object v0, p0, Lcom/melodix/music/MainActivity;->I:Landroid/widget/ImageView;

    .line 129
    .line 130
    if-eqz v0, :cond_9

    .line 131
    .line 132
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    if-eqz v0, :cond_9

    .line 137
    .line 138
    invoke-virtual {v0, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    if-eqz v0, :cond_9

    .line 143
    .line 144
    const-wide/16 v7, 0x12c

    .line 145
    .line 146
    invoke-virtual {v0, v7, v8}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    if-eqz v0, :cond_9

    .line 151
    .line 152
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 153
    .line 154
    .line 155
    :cond_9
    invoke-virtual {p0}, Le6;->getResources()Landroid/content/res/Resources;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 164
    .line 165
    int-to-float v0, v0

    .line 166
    const/high16 v4, 0x43200000    # 160.0f

    .line 167
    .line 168
    div-float/2addr v0, v4

    .line 169
    const/high16 v4, -0x3db80000    # -50.0f

    .line 170
    .line 171
    mul-float/2addr v0, v4

    .line 172
    iget-object v4, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 173
    .line 174
    if-eqz v4, :cond_a

    .line 175
    .line 176
    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    if-eqz v4, :cond_a

    .line 181
    .line 182
    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 183
    .line 184
    .line 185
    :cond_a
    iget-object v4, p0, Lcom/melodix/music/MainActivity;->J:Landroid/widget/ImageView;

    .line 186
    .line 187
    if-eqz v4, :cond_b

    .line 188
    .line 189
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v4, v3}, Landroid/view/View;->setAlpha(F)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v4, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v4}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    invoke-virtual {v3, v6}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    invoke-virtual {v3, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    new-instance v1, Lh2;

    .line 215
    .line 216
    const/4 v2, 0x2

    .line 217
    invoke-direct {v1, v2, p0}, Lh2;-><init>(ILjava/lang/Object;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 225
    .line 226
    .line 227
    :cond_b
    return-void

    .line 228
    nop

    .line 229
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
